# == Schema Information
#
# Table name: purchases
#
#  id               :integer          not null, primary key
#  expire_at        :datetime
#  price            :decimal(8, 2)
#  purchasable_type :string           not null
#  purchased_at     :datetime
#  video_quality    :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  purchasable_id   :integer          not null
#  user_id          :integer          not null
#
# Indexes
#
#  index_purchases_on_purchasable_type_and_purchasable_id  (purchasable_type,purchasable_id)
#  index_purchases_on_user_id                              (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
FactoryBot.define do
  factory :purchase do
    user
    purchased_at { Time.current }
    expire_at { purchased_at + 2.days }
  end
end
