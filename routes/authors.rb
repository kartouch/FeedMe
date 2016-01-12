require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/json'
require_relative '../models/author.rb'

class AuthorsController < Sinatra::Base
  set :json_encoder, :to_json
  set :json_content_type, 'application/json;charset=utf-8'

 get '/' do
   Author.all.to_json
 end

 post '/' do
   @request_payload = JSON.parse request.body.read
   @author = Author.new(name: @request_payload['name'])
   if @author.save
     json status: 200
   else
     json status: 400
   end
 end
end
