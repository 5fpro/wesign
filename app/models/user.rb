class User < ActiveRecord::Base

  devise :async

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :title, :body
  include Omniauthable

  has_many :petitions
  has_many :petition_users, :dependent => :destroy
  has_many :petitions, :through => :petition_users

  # attr_accessible :name

end
