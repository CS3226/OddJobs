class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :title
      t.integer :sender_id
      t.string :receiver_id
      t.string :integer

      t.timestamps null: false
    end
  end
end
