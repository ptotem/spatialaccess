class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.integer :client_id
      t.string :name

      t.timestamps
    end
  end
end
