class AddCampaignIdToSlots < ActiveRecord::Migration
  def change
    add_column :slots, :campaign_id, :integer
  end
end
