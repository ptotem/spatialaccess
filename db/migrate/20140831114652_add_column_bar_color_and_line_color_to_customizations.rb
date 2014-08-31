class AddColumnBarColorAndLineColorToCustomizations < ActiveRecord::Migration
  def change
    add_column :customizations, :bar_color, :string
    add_column :customizations, :line_color, :string
  end
end
