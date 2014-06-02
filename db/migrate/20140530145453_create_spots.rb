class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.integer :campaign_id
      t.integer :hour_id
      t.integer :channel_id
      t.date :airdate
      t.string :programme

      t.timestamps
    end
  end
end
