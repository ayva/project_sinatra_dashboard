require 'sinatra'

require 'erb'
require_relative 'scrapper.rb'
require_relative 'temp_data.rb'
require_relative 'geo.rb'



 #data will be an array of positions with info in each [position_name,company,link,location, date,company_id,job_id]

get '/' do
  ip=request.ip
  geo_info=Locator.new(ip).getgeoip
  response.set_cookie("ip",
            :ip => geo_info["ip"],
            :city => geo_info["city"])

  erb :index, :locals => {:ip => ip, :city => city}
end

post '/' do 
  #ip=request.cookies["ip"]
  job = params[:job ]

  if params[:job].empty?  
    redirect '/'  # search screen again
  elsif params[:city].empty? 
    city = request.cookies["ip"[city]] unless request.cookies["ip"[city]].empty?
  end

    data = Scrapper.new.scrap(job, city)
    erb :results , :locals => {:data => data }

end

