# == Schema Information
#
# Table name: seasons
#
#  id         :integer          not null, primary key
#  number     :integer
#  plot       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Season < ApplicationRecord
  has_many :purchases, as: :purchasable
  has_many :episodes, -> { order(number: :desc) }, dependent: :delete_all

  validates_presence_of :title, :plot

  scope :list, -> { includes(:episodes).order(created_at: :desc) }
end
