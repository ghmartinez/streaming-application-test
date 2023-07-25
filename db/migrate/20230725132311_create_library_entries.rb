class CreateLibraryEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :library_entries do |t|
      t.string :content_type
      t.date :expiration_date
      t.references :user, null: false, foreign_key: true
      t.references :content, polymorphic: true, null: false

      t.timestamps
    end
  end
end
