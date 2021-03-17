class Admin::ItemsController < ApplicationController
    def index
        @items = Item.page(params[:page]).per(8)
    end

    def new
        @item = Item.new
        @genre = Genre.all
    end

    def create
        @item = Item.new(item_params)
        @item.save
        redirect_to admin_item_path(@item)
    end

    def show
        @item = Item.find(params[:id])
    end

    def edit
        @item = Item.find(params[:id])
        @items = Item.all
    end

    def update
        @item = Item.find(params[:id])
        @item.update(item_params)
        redirect_to admin_item_path, notice: '変更を保存しました'
    end

    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to admin_items_path, notice: '削除しました'
    end

    private
    def item_params
        params.require(:item).permit(:name, :genre_id, :image, :price, :is_active, :introduction)
    end
end
