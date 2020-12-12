class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    
    
    dashboard_path # your path
  end

   private

  def user_not_authorized

    flash[:alert] = "Not authroized."
    redirect_to root_path
  end
end
