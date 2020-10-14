class AddExpireAtToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :expire_at, :datetime
  end
end
