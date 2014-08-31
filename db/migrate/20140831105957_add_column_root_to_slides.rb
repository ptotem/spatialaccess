class AddColumnRootToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :root, :boolean
  end
end
