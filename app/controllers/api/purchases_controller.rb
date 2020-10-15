class Api::PurchasesController < ApplicationController
  def create
    @new_purchase = PurchaseService.new.purchase(params[:user_id], @purchasable)
    json_response(@new_purchase)
  rescue StandardError => e
    json_response({
                    message: 'Can\'t process the purchase !!'
                  })
  end
end
