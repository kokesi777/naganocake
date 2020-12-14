class ApplicationController < ActionController::Base
    befor_action :login_requierd

    private
        def login_requierd
            redirect_to login_url unless current_user
        end
end
