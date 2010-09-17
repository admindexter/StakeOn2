class User < ActiveRecord::Base
  has_one :spec

  attr_accessible :username, :email, :password, :password_confirmation, :photo
  acts_as_authentic
end

