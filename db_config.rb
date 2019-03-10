require 'active_record'

options ={
  adapter: 'postgresql',
  database: 'social_app'
}

ActiveRecord::Base.establish_connection(options)