class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_current_user, except: [:show]

  def show
    @user = User.find(params[:id])
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: t('controllers.users.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  private

  def set_current_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end
end
