class Presentation < ActiveRecord::Base
  has_many :presentation_templates
  has_many :slides, through: :presentation_templates

  # rails_admin do
  #   list do
  #     field :title
  #   end
  # end

end
