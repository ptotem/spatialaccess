class User < ActiveRecord::Base

  belongs_to :client
  #extend DeviseOverrides

  # Include default devise modules. Others available are:
  # :confirmable, :validatable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  default_scope { where(client_id: Client.current_id) }

  validates_uniqueness_of    :email,     :case_sensitive => false, :allow_blank => true, :if => :email_changed?, scope: :client_id
  validates_format_of :email, :with  => Devise.email_regexp, :allow_blank => true, :if => :email_changed?
  validates_presence_of   :password, :on=>:create
  validates_confirmation_of   :password, :on=>:create
  validates_length_of :password, :within => Devise.password_length, :allow_blank => true

#  Devise Overrides

  #def self.find_for_authentication(conditions)
   # unscoped { super(conditions) }
  #end

  def serialize_from_session(key, salt)
    unscoped { super(key, salt) }
  end

  def send_reset_password_instructions(attributes={})
    unscoped { super(attributes) }
  end

  def reset_password_by_token(attributes={})
    unscoped { super(attributes) }
  end

  def find_recoverable_or_initialize_with_errors(required_attributes, attributes, error=:invalid)
    unscoped { super(required_attributes, attributes, error) }
  end

  def send_confirmation_instructions(attributes={})
    unscoped { super(attributes) }
  end

  def confirm_by_token(confirmation_token)
    unscoped { super(confirmation_token) }
  end

  rails_admin do
    field :client
    field :email
    field :password
    field :password_confirmation
  end

end
