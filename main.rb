require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pg'

require_relative 'db_config'
require_relative 'models/user'
require_relative 'models/tweet'

enable :sessions

helpers do

  def current_user
    User.find(session[:user_id])
  end

  def logged_in?
    if current_user
      true
    else
      false
    end
  end

end

get '/' do
  erb :index
end

get '/sign_up' do
  erb :sign_up
end

post '/sign_up' do
  user = User.new
  user.firstname = params[:firstname]
  user.lastname = params[:lastname]
  user.email = params[:email]
  user.password = params[:password]
  user.save
  redirect '/'
end

get '/login' do
  erb :login
end

post '/login' do
# find the user by id
  # authenticate the user
  # if both are OK -> put the user in the session
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    erb :login
  end

end

post '/users/:id/tweets' do
  user = User.find(params[:id])
  user.tweets.create!(content: params[:content])
  redirect '/'
end





