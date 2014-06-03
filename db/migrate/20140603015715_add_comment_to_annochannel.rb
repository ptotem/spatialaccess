class AddCommentToAnnochannel < ActiveRecord::Migration
  def change
    add_column :annochannels, :comment, :text
  end
end
