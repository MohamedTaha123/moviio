class Api::PurchasesController < ApplicationController
  def create
    @new_purchase = PurchaseService.new.purchase(params[:user_id], @purchasable)
    json_response(@new_purchase)
  rescue StandardError => e
    json_response({
    				params: params,
                    message: 'Something bad happened !!'
                  })
  end
end
