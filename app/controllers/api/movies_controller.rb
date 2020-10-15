class Api::MoviesController < ApplicationController
  # Return Movies Ordered by Creation
  def index
    @movies = Movie.order(created_at: :desc)
    json_response(@movies)
  end
end
