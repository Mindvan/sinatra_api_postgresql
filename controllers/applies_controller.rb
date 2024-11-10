get '/applies_read' do
  collection_to_api(Apply.read)
end

get '/applies_unread' do
  collection_to_api(Apply.unread)
end
