class User < ActiveRecord::Base
  include Omniauthable
  include Gravtastic
  gravtastic :email

  devise :async

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :title, :body

  has_many :created_petitions, :class_name => "Petition", :foreign_key => "user_id"
  has_many :linked_petition_users, :class_name => "PetitionUser", :foreign_key => "user_id"
  has_many :linked_petitions, :through => :linked_petition_users, :source => :petition
  has_many :petition_users, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  # attr_accessible :name

  def sign?(petition)
    petition_users.map(&:petition_id).include?(petition.id)
  end

  def pic_url(size = 100)
    return "http://graph.facebook.com/#{fb_id}/picture?width=#{size}&height=#{size}" if fb_id.present?
    gravatar_url :size => size
  end

end
