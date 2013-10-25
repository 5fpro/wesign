class PetitionMail < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :petition

  validates_presence_of :title, :body

  after_create :send_mail_to_user

  private

  def send_mail_to_user
    self.petition.users.find_each do |user|
      PetitionUserMailer.delay.petition_mail_user(id, user.id) if title.present? && body.present?
    end
  end
end
