# -*- encoding : utf-8 -*-
require "sinatra/activerecord"

class Author < ActiveRecord::Base
   validates_presence_of :name
  validates_uniqueness_of :name
end
