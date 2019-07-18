class Api::MoviesController < ApplicationController
  def index
    if params[:search]
      if params[:search] != ''
        @movies = search_by_title_and_body(params[:search])
        if @movies.count > 0
          render json: @movies
        end
      else
        @movies = Movie.all.page params[:page]
        render json: @movies
      end
    else
      @movies = Movie.all.page params[:page]
      render json: @movies
    end
  end

  def search_by_title_and_body(search)
    Movie.where("title LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
  end
end
