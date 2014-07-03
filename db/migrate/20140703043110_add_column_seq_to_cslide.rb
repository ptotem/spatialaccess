class AddColumnSeqToCslide < ActiveRecord::Migration
  def change
    add_column :slides, :seq, :integer
  end
end
