class PresentationTemplate < ActiveRecord::Base
  belongs_to :presentation
  belongs_to :slide
end
