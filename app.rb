require 'sinatra'
require 'scrapper'



data=Scrapper.new.scrap #data will be an array of positions with info in each [position_name,company,link,location, date,company_id,job_id]

get '/' do
  data.each do |pos|
    "<h3>Position name: '#{pos[0]}'</h3>
    <h3>Company name: '#{pos[1]}'</h3>"
  end
end