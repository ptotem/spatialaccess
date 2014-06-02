class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.integer :channel_id
      t.datetime :start_date
      t.datetime :end_date
      t.integer :hour_id
      t.float :tvr

      t.timestamps
    end
  end
end
