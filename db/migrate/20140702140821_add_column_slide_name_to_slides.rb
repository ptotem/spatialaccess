class AddColumnSlideNameToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :name, :string
  end
end
