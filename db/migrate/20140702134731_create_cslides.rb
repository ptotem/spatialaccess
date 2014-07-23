class CreateCslides < ActiveRecord::Migration
  def change
    create_table :cslides do |t|
      t.integer :child_id
      t.integer :slide_id
      t.timestamps
    end
  end
end
