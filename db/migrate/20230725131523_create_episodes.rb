class CreateEpisodes < ActiveRecord::Migration[7.0]
  def change
    create_table :episodes do |t|
      t.string :title
      t.string :plot
      t.integer :episode_number
      t.references :season, null: false, foreign_key: true

      t.timestamps
    end
  end
end
