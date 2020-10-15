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
class Purchase < ApplicationRecord
  require 'action_view'
  include ActionView::Helpers::DateHelper

  belongs_to :purchasable, polymorphic: true
  belongs_to :user
  before_save :default_values
  

  # enum video_quality: { "HD": 0, "SD": 1 }

  validates_presence_of :user, :purchasable

  # Alive's scope
  scope :alive, lambda {
    where('expire_at > :time_now and purchased_at <= :time_now', time_now: Time.current)
  }

  # defalut values to price: 9.0, video quality: hd/sd
  def default_values
    self.video_quality ||= %w[HD SD].sample
    self.price ||= (5.0...11.0)
  end

  # Remaining time
  def remaining_time
    distance_of_time_in_words(Time.now ,self.expire_at, include_seconds: true)
  end
end
