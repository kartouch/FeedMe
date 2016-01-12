require 'sinatra'
require "sinatra/activerecord"
require 'sinatra/json'
require 'redis'
require_relative './models/feed.rb'
require_relative './models/category.rb'

class FeedMe < Sinatra::Base

  set :database_file, "./config/database.yml"
  set :json_encoder, :to_json
  set :json_content_type, 'application/json;charset=utf-8'

 get '/' do
     @feeds =  Feed.find_by_sql("select * from feeds order by random() limit 3000")
     erb :index
 end

 get '/v1/api/feeds' do
    redis = Redis.new
    if redis.get("feeds").nil?
      redis.set("feeds", Feed.find_by_sql("select * from feeds order by random() limit 3000").to_json)
      redis.expire("feeds",300)
      redis.get("feeds")
    else
      redis.get("feeds")
    end
  end
end
