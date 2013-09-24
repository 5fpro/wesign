class Petition < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :category, :counter_cache => :petitions_count
  has_many :timelines, :dependent => :destroy
  has_many :petition_users, :dependent => :destroy
  has_many :users, :through => :petition_users
  accepts_nested_attributes_for :petition_users, :allow_destroy => true
  
  validates_presence_of :name, :category_id, :user_id, :target, :intro, :content
  
  mount_uploader :pic, PicUploader

  def percentage_progress
    if targeting_count.present?
      (Float(signs_count.to_i) / targeting_count.to_i * 100).ceil
    else
      if signs_count.to_i < 10000
        arr = [20, 50, 100, 150, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1200, 1500, 2000, 2500, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000]
        arr.each do |value|
          return (Float(signs_count.to_i) / value.to_i * 100).ceil if signs_count.to_i <= value * 0.8
        end
      else
        value = (signs_count.to_i / 10000 + 1).ceil * 10000
        (Float(signs_count.to_i) / value.to_i * 100).ceil
      end
    end
  end

  def percentage_targeting_count
    if targeting_count.present?
      targeting_count
    else
      if signs_count.to_i < 10000
        arr = [20, 50, 100, 150, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1200, 1500, 2000, 2500, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000]
        arr.each do |value|
          return value if signs_count.to_i <= value * 0.8
        end
      else
        (signs_count.to_i / 10000 + 1).ceil * 10000
      end
    end
  end

end
