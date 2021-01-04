class Public::EndUsersController < ApplicationController
    befor_action :login_required
    
    def show
        @end_user = EndUser.find(params[:id])
    end

    def edit
    end
        
    def unsubscribe
    end

    private
    def login_required
        redirect_to root_path
    end

end
