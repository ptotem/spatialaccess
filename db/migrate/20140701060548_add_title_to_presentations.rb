class AddTitleToPresentations < ActiveRecord::Migration
  def change
    add_column :presentations, :title, :string
  end
end
