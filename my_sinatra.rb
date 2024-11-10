# запросы API
require 'sinatra/namespace'
require 'sinatra'
require 'sinatra/base'
# module MyAppModule

# class App < Sinatra::Base
# register Sinatra::Namespace
get '/' do
  'Hello My Sinatra - Easy and Wide world!'
end


get 'hello/:name' do
  "Sinatra приветствует тебя, #{params[:name]}!"
end

get '/*' do
  "I don't know what is the #{params[:splat]}. It's what you typed."
end

namespace '/api/v1' do  # 2-nd stage namespace
  get "/*" do
    "I don't know what is the #{params[:splat]}. It's what you typed."
  end
end

get '/players/:sport_id' do
  # Значение параметра доступно через params[:sport_id]
end

get '/players/*/:year' do
  # /players/performances/2016
  # Параметры - params['splat'] -> ['performances'], params[:year] -> 2016
end

# end
# end