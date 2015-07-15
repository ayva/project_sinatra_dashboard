require 'Nokogiri' 
require 'open-uri'
require 'json'


ID=File.readlines('key.md')[0].to_s
KEY=File.readlines('key.md')[1].to_s

class CompanyProfiler
  def initialize(company_name)
    @name=company_name
  end

  def company_data
    url="http://api.glassdoor.com/api/api.htm?v=1&format=json&t.p=#{ID}&t.k=#{KEY}=employers&q=pharmaceuticals&userip=192.168.43.42&useragent=Mozilla/%2F4.0"
    text = Nokogiri::HTML(open(url)).text
    puts text
  end
end

