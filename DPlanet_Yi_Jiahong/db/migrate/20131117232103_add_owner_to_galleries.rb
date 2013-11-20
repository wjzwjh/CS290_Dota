class AddOwnerToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :owner, :string
  end
end
