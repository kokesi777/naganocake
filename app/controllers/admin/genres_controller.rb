class Admin::GenresController < ApplicationController
    before_action :authenticate_admin!

    def index
        @genre = Genre.new
        @genres = Genre.all
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
    end

    def destroy
        reset_session
        redirect_to admin_root_path, notice: 'ログアウトしました'
    end


    private
    def genre_params
        params.require(:genre).permit(:name, :is_actibe)
    end

end
