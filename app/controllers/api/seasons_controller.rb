class Api::SeasonsController < ApplicationController
  # Return Seasons ordered by creation, including the list of episodes ordered by its number
  def index
    @season = Season.order(created_at: :desc)
    json_response(@season)
  end
end
