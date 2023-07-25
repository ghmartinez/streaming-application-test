class CreateSeasons < ActiveRecord::Migration[7.0]
  def change
    create_table :seasons do |t|
      t.string :title
      t.string :plot
      t.integer :season_number

      t.timestamps
    end
  end
end
