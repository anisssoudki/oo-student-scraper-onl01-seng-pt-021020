require 'open-uri'
require 'pry'

class Scraper

#     def self.scrape_index_page(index_url)
#       s = []
#     students = []
#     student_details = {}
#     html = open(index_url)
#     index = Nokogiri::HTML(html)
#     counter = 0 
   
#   array_of_names =  index.css("div.student-card").css("a").css("div.card-text-container").css("h4.student-name").children
#   while counter < array_of_names.length
#   students <<  array_of_names[counter].text
#   counter = counter + 1 
   
# end
# students
# student_details[:name] = students[0]
# s << student_details
# student_details[:name] = students[1]
# p student_details
# p s
#   end
 def self.scrape_index_page(index_url)
    students = []
    html = open(index_url)
    index = Nokogiri::HTML(html)
    index.css("div.student-card").each do |student|
      student_details = {}
      student_details[:name] = student.css("h4.student-name").text
      student_details[:location] = student.css("p.student-location").text
      profile_path = student.css("a").attribute("href").value
      student_details[:profile_url] = './fixtures/student-site/' + profile_path
      students << student_details
    end
    p students
  end
  

end

