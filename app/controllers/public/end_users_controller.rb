class Public::EndUsersController < ApplicationController
    def show
        @end_user = EndUser.find(params[:id])
    end

    def edit
        @end_user = current_end_user
    end
        
    def unsubscribe
    end


end
