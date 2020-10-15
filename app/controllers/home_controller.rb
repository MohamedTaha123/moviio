class HomeController < ApplicationController
  def index
    @movies = Movie.all
    @seasons = Season.all
    render json: {
      movies: @movies,
      seasons: @seasons
    }
  end
end
