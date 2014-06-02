class Slot < ActiveRecord::Base
  belongs_to :hour
  belongs_to :channel

  require 'roo'

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    (6..spreadsheet.last_row-22).each do |i|
      slot=Slot.new
      Channel.create!(name:spreadsheet.row(i)[0]) if Channel.find_by_name(spreadsheet.row(i)[0]).blank?
      slot.channel_id=Channel.find_by_name(spreadsheet.row(i)[0]).id
      slot.start_date=spreadsheet.row(i)[1]
      slot.end_date=spreadsheet.row(i)[2]
      slot.hour_id=Hour.where(name:"#{((i-6)%24)+2}").first.id
      slot.tvr=spreadsheet.row(i)[5]
      slot.save
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when '.csv' then Roo::Csv.new(file.path, nil, :ignore)
      when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
      when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
