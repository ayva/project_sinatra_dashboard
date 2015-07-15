
require 'Nokogiri' 
require 'open-uri'
require 'json'

class Locator

  def initialize(ip)
    
    @ip=ip
    
  end

  def getgeoip
    url="http://www.telize.com/geoip/" + "#{@ip}"
    hash = JSON.parse (Nokogiri::HTML(open(url)).css('p').text )

    hash
  end
  

end

#Locator.new("73.158.206.211").getgeoip

#Locator.new("127.0.0.1").getgeoip