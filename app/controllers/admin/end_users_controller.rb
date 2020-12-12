class Admin::EndUsersController < ApplicationController
  def index
    @emd_users = Enduser,all
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
  end

  def update
  end
end
