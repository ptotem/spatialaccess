class LastSlide < ActiveRecord::Base
  belongs_to :campaign
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  rails_admin do
  end
end
