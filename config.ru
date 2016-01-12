require 'sinatra/base'
require 'rack'
require_relative './app.rb'
require_relative './routes/authors.rb'
require_relative './routes/sources.rb'
require_relative './routes/categories.rb'

map('/') { run FeedMe }
map('/api/v1') do
  map('/authors') { run AuthorsController }
  map('/sources') { run SourcesController }
  map('/categories') { run CategoriesController }
end
