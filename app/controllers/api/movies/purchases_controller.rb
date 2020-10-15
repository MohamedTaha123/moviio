class Api::Movies::PurchasesController < Api::PurchasesController
  before_action :set_purchasable

  private

  def set_purchasable
    @purchasable = Movie.find(params[:movie_id])
  end
end
