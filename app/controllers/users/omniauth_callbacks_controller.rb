module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def vkontakte
      authenticate_user(:vkontakte)
    end

    def facebook
      authenticate_user(:facebook)
    end

    private

    def authenticate_user(provider)
      @user = User.find_for_oauth(request.env['omniauth.auth'])

      if @user.persisted?
        flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider)
        sign_in_and_redirect @user, event: :authentication
      else
        flash[:error] = I18n.t(
          'devise.omniauth_callbacks.failure',
          kind: provider,
          reason: 'authentication error'
        )

        redirect_to root_path
      end
    end
  end
end
