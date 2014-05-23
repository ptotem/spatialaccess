class ReindexUsersByEmailAndSubdomain < ActiveRecord::Migration
  def change
    remove_index :users, :email
    add_index :users, [:email, :client_id], :unique => true
  end
end
