class AddCommentToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :comment, :text
  end
end
