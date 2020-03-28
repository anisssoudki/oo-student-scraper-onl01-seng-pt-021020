require 'open-uri'
require 'pry'

class Scraper

    def self.scrape_index_page(index_url)
      s = []
    students = []
    student_details = {}
    html = open(index_url)
    index = Nokogiri::HTML(html)
    counter = 0 
   
  array_of_names =  index.css("div.student-card").css("a").css("div.card-text-container").css("h4.student-name").children
   while counter < array_of_names.length
   students <<  array_of_names[counter].text
   counter = counter + 1 
   
 end
 students
student_details[:name] = students[0]
s << student_details
student_details[:name] = students[1]
p student_details
p s
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

