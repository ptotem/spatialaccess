class AddColumnToCompaign < ActiveRecord::Migration
  def self.up
    add_attachment :campaigns, :cfile
    add_attachment :campaigns, :sfile
  end

  def self.down
    remove_attachment :campaigns, :cfile
    remove_attachment :campaigns, :sfile
  end
end
