class AddColumnsToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :tg, :string
    add_column :campaigns, :start_date, :date
    add_column :campaigns, :end_date, :date
    add_column :campaigns, :markets, :string
  end
end
