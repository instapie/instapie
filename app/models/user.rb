class User < ActiveRecord::Base
  has_secure_password

  has_many :questions
  has_many :answers

  validates_presence_of :name
  validates_presence_of :email
end
