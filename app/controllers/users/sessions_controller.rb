# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "new")  
    session["resource_email"] = resource.email
    session["resource_name"] = resource.name
    flash[:notice] = "Welcome, #{session["resource_name"]}!"
    sign_in_and_redirect(resource_name, resource)
  end

  # DELETE /resource/sign_out
  # def destroy  
  #   flash[:notice] = "#{session["resource_name"]} signed out successfully.."  
  #   sign_out_and_redirect(resource_name)  
  # end 
 

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  # end
end
