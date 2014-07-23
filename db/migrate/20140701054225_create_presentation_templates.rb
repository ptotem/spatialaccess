class CreatePresentationTemplates < ActiveRecord::Migration
  def change
    create_table :presentation_templates do |t|

      t.timestamps
    end
  end
end
