class AddAttachmentIconToClients < ActiveRecord::Migration
  def self.up
    change_table :clients do |t|
      t.attachment :icon
    end
  end

  def self.down
    drop_attached_file :clients, :icon
  end
end
