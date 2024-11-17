require 'sinatra/namespace'
require 'sinatra'
require 'sinatra/base'

namespace '/api/v1' do
  # get '/jobs -- http://localhost:4567/jobs?company=Spring
  # http://localhost:4567/jobs?place=Remo
  # http://localhost:4567/jobs?company= - all

  get '/jobs' do
    logger.info "Logger In get /gobs"
    jobs = Job.all
    [:place, :name].each do |filter|
      jobs = jobs.send(filter, params[filter]) if params[filter]
    end
    collection_to_api(jobs)
  end

  get '/jobs_company/:name' do
    company = Company.where(name: params[:name]).first
    halt(404, { message:'Company Document Not Found', status: 404, params_id: params[:id]}.to_json) unless company
    company_id = company.id
    puts "company id = #{company_id.inspect}"

    jobs = Job.where(company_id: company_id)
    halt(404, { message:'Documents Not Found', status: 404, params_id: params[:id]}.to_json) unless jobs
    # puts "job id = #{job.id.inspect} "
    # puts "job = #{job.values.inspect} "
    collection_to_api(jobs)
  end

  get '/job/:id' do
    job = Job.where(id: params[:id]).first
    halt(404, { message:'Document Not Found', status: 404, params_id: params[:id]}.to_json) unless job
    puts "job id = #{job.id.inspect} "
    puts "job = #{job.values.inspect} "
    job.values.to_json	# serialization
  end

  post '/jobs' do
    job = Job.create(params)
    job.nil? ? [].to_json : company.values.to_json
  end
end