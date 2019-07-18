class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def add_favourite
    @user = User.find(params[:user_id])
    @movie = Movie.find(params[:id])
    @user.favourite_movies << @movie
    respond_to do |format|
      format.js {render 'add_favourite'}
    end
  end

  def delete_favourite
    @user = User.find(params[:user_id])
    @movie = Movie.find(params[:id])
    @user.favourite_movies.destroy(@movie)
    respond_to do |format|
      format.js {render 'remove_favourite'}
    end
  end
end