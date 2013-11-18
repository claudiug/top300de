# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
file = File.open('./lib/data/save_files.txt', 'r')
data = Array.new
file.each do |f|
  data.push(f)
end
data.delete_if{|x| x == ""}
data.each do |info|
  Trip.create!(name: info,
              city:info,
              description: "some stuff here",
              zip_code: 1234,
              is_active: true,
              is_feature: true)
end

