class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    # ログイン後
    def after_sign_in_path_for(resource)
      if Admin
        admin_root_path
      else
        root_path
      end
    end

    # ログアウト後
    def after_sign_out_path_for(resource)
      if current_end_user
        root_path
      else
        new_admin_session_path
      end
    end

    protected
  
    def configure_permitted_parameters
      added_attrs = [ :email, :last_name, :first_name, :last_name_kana, :first_name_kana, 
                        :post_code, :address, :telephone_number, 
                        :password, :password_confirmation ]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end
end
