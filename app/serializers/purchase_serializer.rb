class PurchaseSerializer < ActiveModel::Serializer
  cache key: 'purchase'
  attributes :id, :user_id, :purchased_at, :purchasable_type 
end
