class CreateLastSlides < ActiveRecord::Migration
  def change
    create_table :last_slides do |t|
      t.string :header
      t.text :comment
      t.attachment :image
      t.integer :campaign_id
      t.timestamps
    end
  end
end
