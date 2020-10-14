class Season < ApplicationRecord
	has_many :purchases , as: :purchasable
	has_many :episodes

	validates_presence_of :title, :plot
end
