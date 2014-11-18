require 'sinatra'
require 'httparty'
require 'pry'
require 'json'
require 'dotenv'



get '/' do
Dotenv.load
binding.pry
  res = HTTParty.get("https://api.spark.io/v1/devices/#{ENV[DEVICE_ID]}/state\?access_token\=#{ENV[ACCESS_TOKEN]}")
  @status = (res["result"] == 1) ? "Open" : "Occupied"
  binding.pry
  erb :status
end
