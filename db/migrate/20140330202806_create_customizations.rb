class CreateCustomizations < ActiveRecord::Migration
  def change
    create_table :customizations do |t|
      t.integer :client_id

      t.timestamps
    end
  end
end
