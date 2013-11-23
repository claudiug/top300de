ile = File.open('./lib/data/save_files.txt', 'r')
data = Array.new
file.each do |f|
  data.push(f.strip)
end
data.delete_if{|x| x == ""}

#data.each do |info|
#  Trip.create!(name: info,
#               city:"info",
#               description: "some stuff here",
#               zip_code: 1234,
#               is_active: true,
#               is_feature: true)
#end