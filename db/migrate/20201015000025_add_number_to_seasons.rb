class AddNumberToSeasons < ActiveRecord::Migration[6.0]
  def change
    add_column :seasons, :number, :integer
  end
end
