# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :purchases, dependent: :destroy

  validates_uniqueness_of :email
  validates_presence_of :email

  # User's Library
  def own_library
    purchases.merge(Purchase.alive)
  end
end
