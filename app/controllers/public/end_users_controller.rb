class Public::EndUsersController < ApplicationController
    before_action :authenticate_end_user!

    def show
        @end_user = current_end_user
    end

    def edit
        @end_user = current_end_user
    end

    def update
        @end_user = current_end_user
        @end_user.update(end_user_params)
        redirect_to end_users_my_page_path
    end
        
    def unsubscribe
    end

    def withdraw
        current_end_user.update(is_delete: true)
        reset_session
        redirect_to root_path
    end


private
    def end_user_params
        params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_code, :address, :telephone_number, :is_delete)
    end


end
