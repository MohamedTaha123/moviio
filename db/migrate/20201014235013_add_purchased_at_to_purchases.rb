class AddPurchasedAtToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :purchased_at, :datetime
  end
end
