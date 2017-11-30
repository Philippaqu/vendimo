class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :authenticate!
  # before_action :authenticate_company!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
  	if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :encrypted_password])
    elsif resource_class == Company
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :encrypted_password])
    end
  end

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

  protected

  # def authenticate!
  #   binding.pry
  #   authenthicate_user! || authenticate_company!
  #   @current_user = user_signed_in? ? current_user : current_company
  # end

end
