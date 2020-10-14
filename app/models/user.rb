class User < ApplicationRecord
	has_many :purchases, dependent: :destroy

	validates_presence_of :email
end
