class Slide < ActiveRecord::Base
	has_attached_file :image , :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :presentation_templates
  has_many :presentations, through: :presentation_templates

  has_many :cslides
  has_many :childs, :through => :cslides

  has_many :inverse_friendships, :class_name => "Cslide", :foreign_key => "child_id"
  has_many :parents, :through => :inverse_friendships, :source => :slide

end
