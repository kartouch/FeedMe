require "sinatra/activerecord/rake"
require 'feedjira'
require_relative './models/author.rb'
require_relative './models/source.rb'
require_relative './models/feed.rb'
require_relative './models/category.rb'
require 'csv'

namespace :db do
    task :load_config do
          require "./app.rb"
          end
end

namespace :feed do
  desc 'Import feeds from the sources'
  task :import do
    puts '*** Importing Feeds***'
    Source.all.each do |source|
    begin
      feed = Feedjira::Feed.fetch_and_parse source.url
      feed.entries.each do |e|
          Feed.create(title: e.title, url: e.url, category: Category.find(source.category_id).name)
      end
    rescue
      next
    end
    end
  end
end

  namespace :source do
    desc 'Import source from base csv'
    task :import do
      puts '*** start import rss sources ***'
      APP_ROOT = File.dirname(__FILE__)
      CSV.foreach("#{APP_ROOT}/source.csv" )do |row|
      Author.create(name: row[2])
      Category.create(name: row[3])
      Source.create(author_id: Author.find_by_name(row[2]).id, url: row[4], category_id: Category.find_by_name(row[3]).id)
    end
  end
end
