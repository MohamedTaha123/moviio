class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :purchasable_id, :purchased_at, :expire_at , :purchasable_type
end
