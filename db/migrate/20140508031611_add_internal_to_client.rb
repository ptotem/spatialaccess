class AddInternalToClient < ActiveRecord::Migration
  def change
    add_column :clients, :internal, :boolean
  end
end
