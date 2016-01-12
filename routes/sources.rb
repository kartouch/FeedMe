require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/json'
require_relative '../models/source.rb'

class SourcesController < Sinatra::Base
  set :json_encoder, :to_json
  set :json_content_type, 'application/json;charset=utf-8'

 get '/' do
   Source.all.to_json
 end

 post '/' do
   @request_payload = JSON.parse request.body.read
   @source = Source.new(name: @request_payload['name'], author_id: @request_payload['author_id'] )
   if @source.save
     json status: 200
   else
     json status: 400
   end
 end
end
