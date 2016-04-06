class AddRemunerationToListings < ActiveRecord::Migration
  def change
    add_column :listings, :remuneration, :string
  end
end
