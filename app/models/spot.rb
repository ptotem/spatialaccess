class Spot < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :channel
  belongs_to :hour
end
