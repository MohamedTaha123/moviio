class CreateEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :episodes do |t|
      t.string :title
      t.string :plot
      t.references :season, null: false, foreign_key: true

      t.timestamps
    end
  end
end
