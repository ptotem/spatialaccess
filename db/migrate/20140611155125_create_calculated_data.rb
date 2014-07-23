class CreateCalculatedData < ActiveRecord::Migration
  def change
    create_table :calculated_data do |t|
      t.integer :campaign_id
      t.integer :channel_id
      t.hstore :channel_slots
      t.hstore :channel_spots
      t.hstore :channel_maxes

      t.timestamps
    end
  end
end
