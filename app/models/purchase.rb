class Purchase < ApplicationRecord
  belongs_to :purchasable, polymorphic: true
  belongs_to :user

  enum video_quality: { "HD": 0, "SD": 1}

  validates_presence_of :user , :purchasable

  # Alive's scope
  scope :alive, -> {
    where("expire_at > :time_now and purchased_at <= :time_now", now: Time.current)
  }
end
