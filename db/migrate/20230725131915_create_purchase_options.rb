class CreatePurchaseOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_options do |t|
      t.string :content_type
      t.decimal :price
      t.string :video_quality
      t.references :content, polymorphic: true, null: false

      t.timestamps
    end
  end
end
