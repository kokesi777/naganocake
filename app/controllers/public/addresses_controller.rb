class Public::AddressesController < ApplicationController
  def new
    @addresses = Address.new
  end
  
  def index
    @addresses = Address.all
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
