require 'models/robot_world'

class RobotWorldApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :method_override, true

  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @tasks = TaskManager.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    TaskManager.create(params[:task])
    redirect '/robots'
  end

  get '/robots/:id' do |id|
    @task = TaskManager.find(id.to_i)
    erb :show
  end

  not_found do
    erb :error
  end

  get '/robots/:id/edit' do |id|
    @task = TaskManager.find(id.to_i)
    erb :edit
  end

  put '/robots/:id' do |id|
   TaskManager.update(id.to_i, params[:task])
    redirect "/robots/#{id}"
  end

  delete '/robots/:id' do |id|
    TaskManager.delete(id.to_i)
    redirect "/robots"
  end
end
