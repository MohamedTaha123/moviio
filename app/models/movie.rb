class Movie < ApplicationRecord
	has_many :purchases, as: :purchasable

	validates_presence_of :title, :plot
end
