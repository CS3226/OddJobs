class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.integer :poster
      t.boolean :is_open?

      t.timestamps null: false
    end
  end
end
