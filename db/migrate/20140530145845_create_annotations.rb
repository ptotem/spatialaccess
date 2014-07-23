class CreateAnnotations < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.integer :annochannel_id
      t.text :comment

      t.timestamps
    end
  end
end
