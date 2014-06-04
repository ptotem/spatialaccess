# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Client.create!(name:"Home", subdomain: "www")

(2..23).each do |i|
  Hour.create!(name:i,start_time:Time.new(1970, 1, 1, i, 0, 0, "+00:00"),end_time:Time.new(1970, 1, 1, i, 59, 59, "+00:00"),)
end
Hour.create!(name:24,start_time:Time.new(1970, 1, 2, 0, 0, 0, "+00:00"),end_time:Time.new(1970, 1, 2, 0, 59, 59, "+00:00"),)
Hour.create!(name:25,start_time:Time.new(1970, 1, 2, 1, 0, 0, "+00:00"),end_time:Time.new(1970, 1, 2, 1, 59, 59, "+00:00"),)