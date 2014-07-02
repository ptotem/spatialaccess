class Cslide < ActiveRecord::Base
  belongs_to :slide
  belongs_to :child, :class_name => "Slide"
end
