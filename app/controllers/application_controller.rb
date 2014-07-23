class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  around_filter :scope_current_client
  before_filter :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :get_customization

  def current_user
    User.unscoped { super }
  end

  private

  def scope_current_client
    Client.current_id = current_client.id #if user_signed_in?
    yield
  ensure
    Client.current_id = nil
  end

  def current_client
    Client.find_by_subdomain! request.subdomain
  end
  helper_method :current_client

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :client_id
  end

  def get_customization
    @customization=current_client.customizations.first
  end

end
