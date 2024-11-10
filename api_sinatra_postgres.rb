require 'sequel'
require 'sequel/extensions/seed'
require  'pg'
require 'json'
require 'multi_json'
require 'sinatra'

get '/' do
  # system 'rake --tasks'
  "Hi! I am api_sinatra_postgres!\n\n"
  # haml :index, :layout => :my_layout
end

# Endpoints format setup
before do
  content_type 'application/json' # To see perfectly in POSTMAN - in tab Pretty
end

def collection_to_api(collection) 		# For Array
  MultiJson.dump(collection.map { |s| s.to_api })
end

%w{ controllers models routes }.each { |dir| Dir.glob("./#{ dir }/*.rb", &method(:require)) }

# %w{ controllers models routes }.each do | dir |
#   $LOAD_PATH << File.expand_path('.', File.join(File.dirname(__FILE__), dir))
#   require File.join(dir, 'init.rb')
# end