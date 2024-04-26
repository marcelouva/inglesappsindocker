require 'sinatra'
require 'sinatra/activerecord'
require 'yaml'
require_relative 'models/user'

set :database, { adapter: "sqlite3", database: "dbingles.sqlite3" }

  get '/' do
    'Welcome'
  end

  get '/adduser' do
    erb :altauser
  end
  
  post '/saveuser' do
    nombre = params[:nombre]
    u = User.new(name: "#{nombre}")
    u.save
    "¡Hola, #{nombre}! Usuario guardado correctamente."
  end
  
