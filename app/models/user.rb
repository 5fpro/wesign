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

  has_many :petitions

  # attr_accessible :name


  def pic_url(size = 100)
    return "http://graph.facebook.com/#{fb_id}/picture?width=#{size}&height=#{size}" if fb_id.present?
    gravatar_url :size => size
  end
end
