require "sinatra/activerecord"

class Source < ActiveRecord::Base
  belongs_to :author
  belongs_to :category
   validates_presence_of :url
   validates_presence_of :author_id
   validates_presence_of :category_id
   validates_uniqueness_of :url
end
