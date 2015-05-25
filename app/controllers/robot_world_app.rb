class RobotWorldApp < Sinatra::Base

  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @robots = RobotWorld.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    RobotWorld.create(params[:robot])
    redirect '/robots'
  end

  get '/robots/:id' do |id|
    @robot = RobotWorld.find(id.to_i)
    erb :show
  end

  not_found do
    erb :error
  end

  get '/robots/:id/edit' do |id|
    @robot = RobotWorld.find(id.to_i)
    erb :edit
  end

  put '/robots/:id' do |id|
   RobotWorld.update(id.to_i, params[:robot])
    redirect "/robots/#{id}"
  end

  delete '/robots/:id' do |id|
    RobotWorld.destroy(id.to_i)
    redirect "/robots"
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = params[:user]
    Pony.mail :to => user[:email],
              :from => "mailbot@robotworld.io",
              :subject => "Welcome to the Wonderful World of Robots #{user[:name]}!!!",
              :html_body => erb(:email)
    redirect '/'
  end
end
