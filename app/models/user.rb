class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_secure_password

  has_many :orders, dependent: :destroy
  has_many :rates, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.name_max_leng}
  validates :email, presence: true, length: {maximum: Settings.email_max_leng},
    uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}
  validates :phone, presence: true, length: {minimum: Settings.phone_min_leng,
    maximum: Settings.phone_max_leng}, numericality: true
  validates :address, presence: true
  validates :password, presence: true, length: {minimum: Settings.pass_min_leng}

  before_save :downcase_email

  private
  def downcase_email
    self.email = email.downcase
  end
end
