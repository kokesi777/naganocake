class Public::AddressesController < ApplicationController
  before_action :authenticate_end_user!

  def index
    @address = Address.new
    @addresses = current_end_user.addresses
  end
  
  def new
    @address = Address.new
  end


  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.end_user_id = current_end_user.id
    @address.save
    redirect_to '/addresses'
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path, notice: '削除しました'
  end


  private
  def address_params
    params.require(:address).permit(:end_user_id, :post_code, :name, :address)
  end
end
