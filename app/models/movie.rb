# == Schema Information
#
# Table name: movies
#
#  id         :integer          not null, primary key
#  plot       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Movie < ApplicationRecord
  has_many :purchases, as: :purchasable

  validates_presence_of :title, :plot

  scope :list, -> { order(created_at: :desc) }
end
