class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_user_can_edit?
  helper_method :can_subscribe?

  def pundit_user
    UserContext.new(current_user, cookies)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: %i[password password_confirmation current_password]
    )
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
  end

  def current_user_can_edit?(model)
    user_signed_in? && (
      model.user == current_user ||
        (model.try(:event).present? && model.event.user == current_user)
    )
  end

  def can_subscribe?(event)
    unless current_user.nil?
      event.user == current_user || event.subscriptions.map(&:user_name).include?(current_user.name)
    end
  end
end
