class AddComment < ActiveRecord::Migration
def change
  add_column :videos, :comment, :text
end
end
