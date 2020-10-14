class User < ApplicationRecord
	has_many :purchases, dependent: :destroy
end
