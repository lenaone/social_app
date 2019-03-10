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





