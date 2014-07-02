class AddPresesntationIdAndSlideIdToPresentationTemplate < ActiveRecord::Migration
  def change
    add_column :presentation_templates, :presentation_id, :integer
    add_column :presentation_templates, :slide_id, :integer
  end
end
