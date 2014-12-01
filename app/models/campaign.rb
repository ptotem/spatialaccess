class Campaign < ActiveRecord::Base
  belongs_to :client
  has_many :slots, dependent: :destroy
  has_many :spots, dependent: :destroy
  has_many :channels, through: :spots
  has_many :annotations#, dependent: :destroy
  has_many :annochannels, dependent: :destroy
  has_one :last_slide, dependent: :destroy
  has_attached_file :cfile
  has_attached_file :sfile
  do_not_validate_attachment_file_type :cfile
  do_not_validate_attachment_file_type :sfile
  accepts_nested_attributes_for :annochannels

  require 'roo'

  def self.import(campaign)
    @campaign = Campaign.find(campaign)
    file = @campaign.cfile#.url(:original)
    puts "---------------------------------------------------------------------------------"
    puts file
    puts "---------------------------------------------------------------------------------"
    spreadsheet = open_spreadsheet(file)
    is_blank = false
    # spreadsheet = Roo::Excelx.new(file, nil, :ignore)
    (6..spreadsheet.last_row).each do |i|
      channel=Channel.find_by_name(spreadsheet.row(i)[0])
      if is_blank == false
        if spreadsheet.row(i)[0].blank?
          is_blank = true
        else
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
    end
    Campaign.calculate_data(@campaign.id)
  end

  def delete_all_slots_and_spots
    self.spots.destroy_all
    self.slots.destroy_all
  end

  def self.calculate_data(campaign)
    #This function basically calculate data an remove all the slots and spots data so that less number of ros
    @campaign = Campaign.find(campaign)
    @channels=@campaign.channels.uniq.sort_by! { |c| c.name }
    @channels.each do |channel|
      @tvr=[]
      Hour.all.each do |hour|
        @tvr << [hour.name.to_i, (Slot.where(channel_id: channel.id, hour_id: hour.id).first.tvr rescue "")]
      end
      temp = Hash.new
      temp[channel.name] = @tvr
      CalculatedData.create!(:campaign_id => @campaign.id, :channel_id => channel.id, :channel_slots => temp)
      #removing Temp Slot Data
      Slot.where(:campaign_id => @campaign.id, :channel_id => channel.id).destroy_all
    end

    @channel_spots=[]
    @channel_maxes=[]
    @totalcount=[]
    @channels.each_with_index do |channel, index|
      @hourcount=[]
      Hour.all.each do |hour|
        @hourcount << Spot.where(channel_id: channel.id, campaign_id: @campaign.id, hour_id: hour.id).count
      end
      @totalcount[index]=@hourcount.sum
      @hoursum=[]
      @maxvalue=0
      Hour.all.each do |hour|
        spotscore=(Spot.where(channel_id: channel.id, campaign_id: @campaign.id, hour_id: hour.id).count*100/@totalcount[index]).to_i
        @hoursum << [hour.name.to_i, spotscore]
        if spotscore>@maxvalue
          @maxvalue=spotscore
        end
      end
      #Finding calculated data created earlier and updating channel spots and channel maxes
      @cal_data = CalculatedData.where(:campaign_id => @campaign.id, :channel_id => channel.id).first
      temp1 = Hash.new
      temp1[channel.name] = @hoursum
      @cal_data.channel_spots = temp1
      temp2 = Hash.new
      temp2[channel.name] = @maxvalue
      @cal_data.channel_maxes = temp2
      @cal_data.save
      Spot.where(:campaign_id => @campaign.id, :channel_id => channel.id).destroy_all
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when '.csv' then
        Roo::Csv.new(file.url, nil, :ignore)
      when '.xls' then
        Roo::Excel.new(file.url, nil, :ignore)
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
