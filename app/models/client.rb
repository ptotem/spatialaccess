class Client < ActiveRecord::Base

  has_many :users
  has_many :customizations, dependent: :destroy
  has_attached_file :icon, :styles => { :thumb => "100x100>" }, :default_url => "/assets/missing_background.jpg"
  validates_attachment_content_type :icon, :content_type => /\Aimage\/.*\Z/

after_create :create_base_users

  def create_base_users
    User.create!(client_id: self.id, email: "admin@spatialaccess.com", password: "p20o20e13", password_confirmation: "p20o20e13")
    User.create!(client_id: self.id, email: "author@spatialaccess.com", password: "p20o20e13", password_confirmation: "p20o20e13")
    User.create!(client_id: self.id, email: "designer@spatialaccess.com", password: "p20o20e13", password_confirmation: "p20o20e13")
    User.create!(client_id: self.id, email: "gamemaster@spatialaccess.com", password: "p20o20e13", password_confirmation: "p20o20e13")
  end

  def self.current_id=(id)
    Thread.current[:client_id] = id
  end

  def self.current_id
    Thread.current[:client_id]
  end

  rails_admin do
    visible do
      bindings[:controller].current_user.email == "admin@chitterbot.com"
    end
  end

end
