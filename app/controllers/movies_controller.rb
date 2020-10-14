class MoviesController < ApplicationController

  # Return Movies Ordered by Creation	
  def index
  	@movies = Movie.order(created_at: :desc)
  	render json: @movies
  end
end
