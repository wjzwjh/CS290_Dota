class AddCommentVersion < ActiveRecord::Migration
 def change
   add_column :videos, :comment_version, :string
 end
end
