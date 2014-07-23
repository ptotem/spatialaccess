class AddColumnClassNameToAnnochannels < ActiveRecord::Migration
  def change
    add_column :annochannels, :class_name, :string
  end
end
