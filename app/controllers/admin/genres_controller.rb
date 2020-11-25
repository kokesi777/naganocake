class Admin::GenresController < ApplicationController
    before_action :authenticate_admin!

    def index
        @genre = Genre.new
    end

    def show
        @genre = Genre.find(params[:id])
    end

    def create
        @genre = Genre.new(genre_params)
        @ganre.save
        redirect_to 'admin/genres'
    end

    def edit
    end

    def destroy
        reset_session
        redirect_to admin_root_path, notice: 'ログアウトしました'
    end


    private
    def genre_params
        params.require(:genre).permit(:name)
    end

end
