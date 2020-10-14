class Season < ApplicationRecord
	has_many :purchases , as: :purchasable
	has_many :episodes
end
