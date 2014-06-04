class Client < ActiveRecord::Base

  has_many :users
  has_many :customizations, dependent: :destroy
  has_many :campaigns, dependent: :destroy
  has_attached_file :icon, :styles => {:thumb => "100x100>"}, :default_url => "/assets/missing_background.jpg"
  validates_attachment_content_type :icon, :content_type => /\Aimage\/.*\Z/

  after_create :create_base_users

  def create_base_users
    User.create!(client_id: self.id, email: "admin@spatialaccessapp.in", password: "mediagods", password_confirmation: "mediagods")
    User.create!(client_id: self.id, email: "content@spatialaccessapp.in", password: "mediagods", password_confirmation: "mediagods")
    User.create!(client_id: self.id, email: "demo@spatialaccessapp.in", password: "mediagods", password_confirmation: "mediagods")
  end

  def self.current_id=(id)
    Thread.current[:client_id] = id
  end

  def self.current_id
    Thread.current[:client_id]
  end

  rails_admin do
    visible do
      bindings[:controller].current_user.email == "admin@spatialaccessapp.in" and bindings[:controller].current_user.client.name == "Home"
    end
    list do
      field :name
      field :subdomain
    end
  end

end
