class Api::Seasons::PurchasesController < Api::PurchasesController
  before_action :set_purchasable

  private

    def set_purchasable
      @purchasable = Season.find(params[:season_id])
    end
end