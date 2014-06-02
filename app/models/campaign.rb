class Campaign < ActiveRecord::Base
  belongs_to :client
  has_many :spots, dependent: :destroy
  has_many :channels, through: :spots
  has_many :annotations, dependent: :destroy
  has_many :annochannels, dependent: :destroy
  accepts_nested_attributes_for :annochannels

  require 'roo'

  def self.import(file, client)
    spreadsheet = open_spreadsheet(file)
    if Campaign.where(client_id: client.id, name: spreadsheet.row(6)[2]).blank?
      campaign=Campaign.create!(client_id: client.id, name: spreadsheet.row(6)[2])
    else
      campaign=Campaign.where(client_id: client.id, name: spreadsheet.row(6)[2]).first
    end

    (6..spreadsheet.last_row-31).each do |i|
      unless Channel.find_by_name(spreadsheet.row(i)[0]).blank?
        spot=Spot.new
        spot.campaign_id=campaign.id
        spot.channel_id=Channel.find_by_name(spreadsheet.row(i)[0]).id
        spot.airdate=spreadsheet.row(i)[2]
        spot.programme=spreadsheet.row(i)[5]
        spothour=Time.at(spreadsheet.row(i)[4]).getgm.hour
        if spothour==0
          spothour=24
        end
        if spothour==1
          spothour=25
        end
        spot.hour_id = Hour.find_by_name("#{spothour}").id
        spot.save
      end
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when '.csv' then
        Roo::Csv.new(file.path, nil, :ignore)
      when '.xls' then
        Roo::Excel.new(file.path, nil, :ignore)
      when '.xlsx' then
        Roo::Excelx.new(file.path, nil, :ignore)
      else
        raise "Unknown file type: #{file.original_filename}"
    end
  end


end
