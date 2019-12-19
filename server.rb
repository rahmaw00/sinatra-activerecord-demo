require 'sinatra/activerecord'
require 'sinatra'
require './models'

set :port, 3000
set :database, {adapter: 'sqlite3', database: './doggly2.sqlite3'}

get '/' do
  erb :home
end
