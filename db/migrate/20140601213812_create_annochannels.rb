class CreateAnnochannels < ActiveRecord::Migration
  def change
    create_table :annochannels do |t|
      t.integer :campaign_id
      t.integer :channel_id
      t.boolean :showable, default: true
      t.string :header

      t.timestamps
    end
  end
end
