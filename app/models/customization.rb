class Customization < ActiveRecord::Base

  default_scope { where(client_id: Client.current_id) }

  belongs_to :client
  attr_accessor :delete_background
  has_attached_file :background, :styles => { :thumb => "100x100>" }, :default_url => "/assets/missing_background.jpg"
  validates_attachment_content_type :background, :content_type => /\Aimage\/.*\Z/
  before_validation { self.background.clear if self.delete_background == '1' }

  rails_admin do

    # edit do
    #   group :basic_group do
    #     label "Basics"
    #     field :client
    #   end
    #   group :design_group do
    #     label "Theme"
    #     active false
    #     field :background do
    #       label "Page Background"
    #     end
    #   end
    # end
  end

end
