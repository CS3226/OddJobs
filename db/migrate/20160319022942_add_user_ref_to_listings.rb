class AddUserRefToListings < ActiveRecord::Migration
  def change
    add_reference :listings, :poster
    add_foreign_key :listings, :users, column: :poster_id
  end
end
