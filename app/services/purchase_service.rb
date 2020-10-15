class PurchaseService
  def purchase(user_id, purchasable)
    user = User.find(user_id)
    purchasable_h = Purchase.find_by(purchasable: purchasable, user_id: user_id)
    if user.own_library.include?(purchasable_h)
      raise StandardError, 'you already have this in your library'
    else
      # purchase = user.purchases.build
      purchase = user.purchases.build
      purchase.user_id = user_id
      purchase.purchasable = purchasable
      purchase.purchased_at = Time.current
      purchase.expire_at = purchase.purchased_at + 2.days
      purchase.save!
      purchase
    end
  end
end
