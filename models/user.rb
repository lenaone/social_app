class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets

  def name
    firstname + ' ' + lastname
  end
end