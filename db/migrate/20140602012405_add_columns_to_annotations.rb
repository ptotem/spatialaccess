class AddColumnsToAnnotations < ActiveRecord::Migration
  def change
    add_column :annotations, :shape, :string
    add_column :annotations, :posx, :integer
    add_column :annotations, :posy, :integer
    add_column :annotations, :height, :integer
    add_column :annotations, :width, :integer
  end
end
