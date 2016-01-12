require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/json'
require_relative '../models/category.rb'

class CategoriesController < Sinatra::Base
  set :json_encoder, :to_json
  set :json_content_type, 'application/json;charset=utf-8'

 get '/' do
   Category.all.to_json
 end

 post '/' do
   @request_payload = JSON.parse request.body.read
   @category = category.new(name: @request_payload['name'])
   if @category.save
     json status: 200
   else
     json status: 400
   end
 end
end
