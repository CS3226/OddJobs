class AddColumnsToListing < ActiveRecord::Migration
  def change
    add_column :listings, :category_id, :string
    add_column :listings, :—force, :string
  end
end
