class AddAvatarColumnsToUsers < ActiveRecord::Migration
  def self.up
    add_attachment :videos, :avatar
  end

  def self.down
    remove_attachment :videos, :avatar
  end
end
