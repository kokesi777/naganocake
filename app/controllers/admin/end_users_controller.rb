class Admin::EndUsersController < ApplicationController
  def index
    @emd_users = Enduser.all
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.find(params[:id])
    @end_user.save
    redirect_to admin_end_user_path
  end

  def update
    @book = Book.find(params[:id])
  end
end
