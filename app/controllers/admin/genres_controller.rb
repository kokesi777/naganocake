class Admin::GenresController < ApplicationController
    before_action :authenticate_admin!

    def index
        @genre = Genre.new
        @genres = Genre.page(params[:page]).reverse_order
        end

    def new
        @genre = Genre.new
    end

    def show
        @genre = Genre.find(params[:id])
    end

    def create
        @genre = Genre.new(genre_params)
        @genre.save
        redirect_to admin_genres_path
    end

    def edit
        @genre = Genre.find(params[:id])
    end

    def update
        @genre = Genre.find(params[:id])
        @genre.update(genre_params)
        redirect_to admin_genres_path, notice: '変更しました'
    end

    def destroy
        reset_session
        redirect_to admin_genres_path, notice: '削除しました'
    end


    private
    def genre_params
        params.require(:genre).permit(:name, :is_active)
    end
    

end
