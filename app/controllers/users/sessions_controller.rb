# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  #   flash[:notice] = "Добро пожаловать, #{session["resource_name"]}!"
    
  #  end

  # POST /resource/sign_in
  def create
    user = User.find_for_authentication(email: params[:user][:email])
    if user.present? && user&.valid_password?(params[:user][:password]) then
      resource = warden.authenticate!(:scope => resource_name, :recall => "new")  
      session["resource_email"] = resource.email
      session["resource_name"] = resource.name
      flash[:notice] = "Добро пожаловать, #{session["resource_name"]}!"
      sign_in_and_redirect(resource_name, resource)
    else
      render 'layouts/incorrect'      
    end
  end

  #DELETE /resource/sign_out
  def destroy
    name = session["resource_name"]
    super 
    flash[:notice] = "До встречи, #{name}!"  
  end 
 

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  # end
end
