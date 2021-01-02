class Admin::EndUsersController < ApplicationController
  def index
    @end_users = Enduser.all
  end

  def show
    @end_user = Enduser.find(params[:id])
  end

  def edit
    @end_user = Enduser.find(params[:id])
    @end_user.save
    redirect_to admin_end_user_path
  end

  def update
    @end_user = Enduser.find(params[:id])
  end
end
