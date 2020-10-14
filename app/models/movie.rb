class Movie < ApplicationRecord
	has_many :purchases, as: :purchasable
end
