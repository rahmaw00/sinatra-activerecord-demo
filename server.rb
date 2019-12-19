require 'sinatra/activerecord'
require 'sinatra'
require './models'
require 'sinatra/flash'

set :port, 3000
set :database, {adapter: 'sqlite3', database: './doggly2.sqlite3'}
enable :sessions

get '/' do
  erb :home
end

get '/login' do
  erb :login
end

post '/login' do
  user = user.find_by(email: params[:email])
  given_password = params[:password]
  if user.password == given_password
    session[:user_id] = user.id
    redirect '/profile'
  else
    flash[:error] = 'Invalid email or password.'
    redirect '/login'
  end
end

get '/signup' do
  erb :signup
end

post '/signup' do
  @user = User.new(params[:user])
  if @user.valid?
    @user.save
    redirect '/profile'
  else
    flash[:error] = @user.errors.full_messages
    redirect '/signup'
  end
end

get '/profile' do
  erb :profile
end
