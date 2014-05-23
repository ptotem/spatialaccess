class AddAttachmentBackgroundToCustomizations < ActiveRecord::Migration
  def self.up
    change_table :customizations do |t|
      t.attachment :background
    end
  end

  def self.down
    drop_attached_file :customizations, :background
  end
end
