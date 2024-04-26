require 'sinatra'
require 'sinatra/activerecord'
require 'yaml'
require_relative 'models/user'

set :database, { adapter: "sqlite3", database: "dbingles.sqlite3" }

  get '/' do
    'Welcome'
  end

  
