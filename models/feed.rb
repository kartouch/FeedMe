require "sinatra/activerecord"

class Feed < ActiveRecord::Base
  belongs_to :category
   validates_presence_of :url
   validates_presence_of :title
   validates_presence_of :category_id
   validates_uniqueness_of :url
end
