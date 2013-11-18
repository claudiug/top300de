file = File.open('save_files.txt', 'r')
data = Array.new
file.each do |f|
  data.push(f.strip)
end