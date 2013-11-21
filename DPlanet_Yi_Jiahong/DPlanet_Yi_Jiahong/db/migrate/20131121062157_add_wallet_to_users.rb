class AddWalletToUsers < ActiveRecord::Migration
  def change
    add_column :users, :wallet, :integer,default: 1000
  end
end
