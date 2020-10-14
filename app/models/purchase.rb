class Purchase < ApplicationRecord
  belongs_to :purchasable, polymorphic: true
  belongs_to :user

  enum video_quality: { "HD": 0, "SD": 1}
end
