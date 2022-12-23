class ApplicationController < ActionController::Base  
    def after_sign_in_path_for(resource)
        start_show_path
    end
    
    def after_sign_out_path_for(resource_or_scope)
        start_show_path
    end  
end
