class Timeline < ActiveRecord::Base
  # attr_accessible :title, :body

  TYPES = [:post, :event, :url, :youtube]
  belongs_to :petition

  validates_presence_of :petition_id
  validates_presence_of :happened_at
  validates_presence_of :title

  scope :recent, order("happened_at DESC")

  before_validation do
    self.happened_at = Time.now unless happened_at.present?
  end

  after_create :parse_type

  def image?
    image_link.present?
  end

  def youtube?
    youtube_link.present?
  end

  def link?
    link.present?
  end

  def type_of?(type_value)
    timeline_type.to_s == type_value.to_s
  end

  def render_content
    return content.to_s.gsub(link, "") if link?
    return content.to_s.gsub(youtube_link, "") if youtube?
    content
  end

  def youtube_id
    youtube_link.scan(/(youtube.com.*(?:\/|v=)(\w+))/)[0][1] rescue ""
  end

  private

  def parse_type
    if parse_youtube
      self.timeline_type = :youtube
    elsif parse_url
      self.timeline_type = :url
      # parse image url from remote page
    elsif !timeline_type
      self.timeline_type = :post
    end
    save
  end

  def parse_youtube
    reg = /(youtube.com.*(?:\/|v=)(\w+))/
    res = content.to_s.scan(reg)
    if res.size > 0
      self.youtube_link = "https://#{res[0][0]}"
      return true
    end
    return false
  end

  def parse_url
    reg = /(http[s]?:\/\/([^\s]+))/i
    res = content.to_s.scan(reg)
    if res.size > 0
      self.link = res[0][0]
      return true
    end
    return false
  end
end
