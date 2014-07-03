class AddColumnChannelNameToCalculatedData < ActiveRecord::Migration
  def change
    add_column :calculated_data, :channel_name, :string
  end
end
