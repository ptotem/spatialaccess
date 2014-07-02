class AddFooterToPresentationTemplate < ActiveRecord::Migration
  def change
    add_column :presentation_templates, :footer, :string
  end
end
