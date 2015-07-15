
require 'Nokogiri' 
require 'open-uri'
require 'json'

class Locator

  def initialize(ip)
    
    @ip=ip
    
  end

  def getgeoip
    url="http://www.telize.com/geoip/" + "#{@ip}"
    page = Nokogiri::HTML(open(url))   
    str=page.css('p').text
    hash=JSON.parse(str)
    hash
  end
  

end

#Locator.new("73.158.206.211").getgeoip

Locator.new("127.0.0.1").getgeoip