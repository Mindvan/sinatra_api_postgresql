require 'sinatra/namespace'
require 'sinatra'
namespace '/api/v1' do

  get '/geeks' do
    logger.info "Logger In get /geeks"
    geeks = Geek.all
    return collection_to_api(geeks) if params.empty?
    if params['name']
      puts 'name'
      geeks_all = Geek.by_name(params['name'])
      if params['stack']
        puts 'name + stack'
        geeks = geeks_all.by_stack(params['stack'])
      else
        puts 'name NO stack'
        geeks = geeks_all
      end
    else
      if params['stack']
        puts 'stack'
        geeks = Geek.by_stack(params['stack'])
      end
    end
    collection_to_api(geeks)
  end

  post '/geeks' do
    geek = Geek.create(params)
    geek.nil? ? [].to_json : geek.values.to_json
  end

  get '/geek_read_applies/:id' do
    applies = Apply.where(geek_id: params[:id], read: true)
    halt(404, { message:'Documents Not Found', status: 404, params_id: params[:id]}.to_json) unless applies
    collection_to_api(applies)
  end

  get '/geek_invited_applies/:id' do
    applies = Apply.where(geek_id: params[:id], invited: true)
    halt(404, { message:'Documents Not Found', status: 404, params_id: params[:id]}.to_json) unless applies
    collection_to_api(applies)
  end

  get '/geek/:id' do
    geek = Geek.where(id: params[:id]).first
    halt(404, { message:'Document Not Found', status: 404, params_id: params[:id]}.to_json) unless geek
    puts "geek id = #{geek.id.inspect} "
    puts "geek = #{geek.values.inspect} "
    geek.values.to_json	# serialization
  end

end