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

  has_many :created_petitions, :class_name => "Petition", :foreign_key => "user_id"
  has_many :petition_users, :dependent => :destroy

  # attr_accessible :name

  def sign?(petition)
    petition_users.map(&:petition_id).include?(petition.id)
  end

end
