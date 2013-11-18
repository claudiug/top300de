require 'open-uri'
require 'nokogiri'

base_url = "http://www.germany.travel/en/towns-cities-culture/top-100/germany-travel-attractions.html?page="
file = File.open("save_files.txt", "w")
(1..10).each do |t|
  puts base_url + t.to_s
  page = Nokogiri::HTML(open(base_url + t.to_s))
  content = page.css("div.articleListHeadline")
  content.each do |c|
    file.puts(c.text)
  end
end