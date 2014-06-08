class Campaign < ActiveRecord::Base
  belongs_to :client
  has_many :slots, dependent: :destroy
  has_many :spots, dependent: :destroy
  has_many :channels, through: :spots
  has_many :annotations, dependent: :destroy
  has_many :annochannels, dependent: :destroy
  has_attached_file :cfile
  has_attached_file :sfile
  do_not_validate_attachment_file_type :cfile
  do_not_validate_attachment_file_type :sfile
  accepts_nested_attributes_for :annochannels

  require 'roo'

  def self.import(campaign)
    @campaign = Campaign.find(campaign)
    file = @campaign.cfile.url(:original)
    puts "---------------------------------------------------------------------------------"
    puts file
    puts "---------------------------------------------------------------------------------"
    spreadsheet = open_spreadsheet(file)
    (6..spreadsheet.last_row-31).each do |i|
      channel=Channel.find_by_name(spreadsheet.row(i)[0])
      unless channel.blank?
        spot=Spot.new
        spot.campaign_id=campaign
        spot.channel_id=channel.id
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

  rails_admin do
    list do
      field :name
      field :start_date
      field :end_date
      field :active
    end
  end


end
