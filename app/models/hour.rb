class Hour < ActiveRecord::Base
  has_many :slots, dependent: :destroy
  has_many :spots, dependent: :destroy
  has_many :annohours, dependent: :destroy
end
