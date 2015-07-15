require 'sinatra'

require 'erb'
require_relative 'scrapper.rb'
require_relative 'temp_data.rb'
require_relative 'geo.rb'

enable :sessions
#session["key"] = "value"

 #data will be an array of positions with info in each [position_name,company,link,location, date,company_id,job_id]

get '/' do
  request.ip == "127.0.0.1" ? ip="73.158.206.211" : ip=request.ip
  geo_info=Locator.new(ip).getgeoip
  geo_info["city"].nil? ? city="San-Francisco" : city=geo_info["city"]
  response.set_cookie("ip",
            :ip => geo_info["ip"],
            :geocity => geo_info["city"])

  erb :index
end

post '/' do 
  #ip=request.cookies["ip"]
  job = params[:job]
  city=params[:city ]

  if params[:job].empty?  
    redirect '/'  # search screen again
  elsif params[:city].empty? 
      city = request.cookies["ip"["city"]] unless request.cookies["ip"["city"]].nil?
  end

    data = Scrapper.new.scrap(job, city)
    erb :results , :locals => {:data => data, :city => city }

end

