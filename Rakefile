require 'sinatra'
require './lib/task/db'

namespace :db do
  task :environment do
    require 'sequel'
    ENV['DATABASE_URL']  ||=
      'postgres://sinatra_admin:password@localhost/sinatra_seq'
    ENV['RACK_ENV'] ||= 'development'
    ENV['DATABASE'] = 'sinatra_seq_dev' if ENV['RACK_ENV'] == 'development'
    ENV['DATABASE'] = 'sinatra_seq_test' if ENV['RACK_ENV'] == 'test'
    ENV['DATABASE'] = 'sinatra_seq_prod' if ENV['RACK_ENV'] == 'production'
  end
end