class ApplicationController < ActionController::Base
    before_action :configure_sign_up_params, if: :devise_controller?

    def after_sign_in_path_for(resource)
        start_show_path
    end
    
    def after_sign_out_path_for(resource_or_scope)
        start_show_path
    end 
    
    protected

    def configure_sign_up_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
    end
end
