class AddColumnClassNameToAnnotations < ActiveRecord::Migration
  def change
    add_column :annotations, :class_name, :string
  end
end
