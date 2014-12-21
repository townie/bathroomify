require 'sinatra'
require 'httparty'
require 'dotenv'

get '/' do
  Dotenv.load
  res = HTTParty.get("https://api.spark.io/v1/devices/#{ENV['DEVICE_ID']}/state\?access_token\=#{ENV['ACCESS_TOKEN']}")
  @status = (res["result"] == 1) ? "Open" : "Occupied"
  erb :status
end

get "/help" do
end
