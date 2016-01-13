# -*- encoding : utf-8 -*-
require "sinatra/activerecord"

class Feed < ActiveRecord::Base
   validates_presence_of :url
   validates_presence_of :title
   validates_presence_of :category
   validates_uniqueness_of :url
end
