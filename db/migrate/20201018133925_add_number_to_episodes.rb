class AddNumberToEpisodes < ActiveRecord::Migration[6.0]
  def change
    add_column :episodes, :number, :integer
  end
end
