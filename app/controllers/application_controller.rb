class ApplicationController < ActionController::Base
   # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  after_filter :store_location

  def store_location
  # store last url - this is needed for post-login redirect to whatever the user last visited.
  return unless request.get? 
  if (request.path != "/logins/sign_in" &&
      request.path != "/logins/sign_up" &&
      request.path != "/logins/password/new" &&
      request.path != "/logins/password/edit" &&
      request.path != "/logins/confirmation" &&
      request.path != "/logins/sign_out" &&
      !request.xhr?) # don't store ajax calls
    session[:previous_url] = request.fullpath 
  end
end

def after_sign_in_path_for(resource)
	boys_path
end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :lastname, :avatar])
  end


end
