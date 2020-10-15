class PurchaseSerializer < ActiveModel::Serializer
  cache key: "purchase"
  attributes :id, :user_id, :purchasable_id, :purchased_at, :expire_at , :purchasable_type
end
