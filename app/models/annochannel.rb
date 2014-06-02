class Annochannel < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :channel
  has_many :annotations, dependent: :destroy
  accepts_nested_attributes_for :annotations, allow_destroy: true
end
