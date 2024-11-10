# require 'sinatra/namespace'
# require 'sinatra'
# require 'sinatra/base'
#
# namespace '/api/v1' do
#
# end
def self.read
  where(read: true)
end

def self.unread
  where(read: false)
end