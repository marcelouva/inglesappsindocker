require 'em/pure_ruby' 
require 'sinatra'
require 'sinatra/activerecord'
require 'yaml'
require_relative 'models/user'

# set :server, 'thin'

set :database, { adapter: "sqlite3", database: "dbingles.sqlite3" }

  get '/' do
    erb :index
  end

  get '/adduser' do
    erb :new_user
  end
  
  post '/saveuser' do
    nombre = params[:nombre]
    u = User.new(name: "#{nombre}")
    u.save
    "¡Hola, #{nombre}! Usuario guardado correctamente."
  end
  
  # Ruta para listar todos los usuarios
  get '/users' do
    @users = User.all
    erb :users_list3  # vista para mostrar la lista de usuarios
  end

    # Ruta para eliminar un usuario
  post '/delete_user' do
    user_id = params[:user_id]
    user = User.find(user_id)
    if user
      user.destroy
      redirect '/users' # Redirigir de nuevo a la lista de usuarios después de eliminar
    else
      "Usuario no encontrado"
    end
  end

  # Ruta para mostrar el formulario de actualización de usuario
  get '/edit_user/:id' do
    @user = User.find(params[:id])
    erb :edit_user
  end

  # Ruta para manejar la actualización de usuario
  post '/update_user' do
    user = User.find(params[:user_id])
    if user
      user.name = params[:nombre]
      user.save
      redirect '/users'
    else
      "Usuario no encontrado"
    end
  end