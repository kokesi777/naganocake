class Public::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = Address.all
  end
  
  def new
    @address = Address.new
  end


  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to '/addresses'
  end

  def update
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path, notice: '削除しました'
  end


  private
  def address_params
    params.require(:address).permit(:post_code, :name, :address)
  end
end
