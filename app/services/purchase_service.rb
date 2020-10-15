class PurchaseService
  def purchase(user_id, purchasable)
    user = User.find(user_id)
    # FIXME: fix this later
    purchasable_h = Purchase.find_by(purchasable: purchasable)
    unless user.own_library.include?(purchasable_h)
      # purchase = user.purchases.build
      purchase = user.purchases.build 
      purchase.user_id = user_id
      purchase.purchasable = purchasable
      purchase.purchased_at = Time.current
      purchase.expire_at = purchase.purchased_at + 2.days
      purchase.save!
      purchase
    else
      raise StandardError.new "you already have this in your library"
    end
  end
end
