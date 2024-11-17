require 'sinatra/namespace'
require 'sinatra'
namespace '/api/v1' do

  post '/applies' do
    apply = Apply.create(params)
    apply.nil? ? [].to_json : company.values.to_json
  end

  get '/applies_company/:name' do
    company = Company.where(name: params[:name]).first
    halt(404, { message:'Company Document Not Found', status: 404, params_id: params[:id]}.to_json) unless company
    company_id = company.id
    puts "company id = #{company_id.inspect}"

    applies = Apply.where(company_id: company_id)
    halt(404, { message:'Documents Not Found', status: 404, params_id: params[:id]}.to_json) unless applies
    collection_to_api(applies)
  end

  get '/apply_geeks/:name' do
    apply = Apply.where(name: params[:name]).first
    halt(404, { message:'Apply Document Not Found', status: 404, params_id: params[:id]}.to_json) unless apply
    apply_id = apply.id
    puts "apply id = #{apply_id.inspect}"

    geeks = Geek.where(apply_id: apply_id)
    halt(404, { message:'Documents Not Found', status: 404, params_id: params[:id]}.to_json) unless geeks
    collection_to_api(geeks)
  end

  get '/apply/:id' do
    apply = Apply.where(id: params[:id]).first
    halt(404, { message:'Document Not Found', status: 404, params_id: params[:id]}.to_json) unless apply
    puts "apply id = #{apply.id.inspect} "
    puts "apply = #{apply.values.inspect} "
    apply.values.to_json	# serialization
  end

  get '/applies_geek/:name' do
    geek = Geek.where(name: params[:name]).first
    halt(404, { message:'Geek Document Not Found', status: 404, params_id: params[:id]}.to_json) unless geek
    geek_id = geek.id
    puts "geek id = #{geek_id.inspect}"

    applies = Apply.where(geek_id: geek_id)
    halt(404, { message:'Documents Not Found', status: 404, params_id: params[:id]}.to_json) unless jobs
    collection_to_api(applies)
  end

  get '/applies_read' do
    collection_to_api(Apply.read)
  end

  get '/applies_unread' do
    collection_to_api(Apply.unread)
  end

  get '/applies_invited' do
    collection_to_api(Apply.invited)
  end

  get '/applies_uninvited' do
    collection_to_api(Apply.uninvited)
  end

end