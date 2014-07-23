class Channel < ActiveRecord::Base
  has_many :slots, dependent: :destroy
  has_many :spots, dependent: :destroy
  has_many :campaigns, through: :spots
  has_many :annotations, dependent: :destroy
end
