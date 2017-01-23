class Product < ApplicationRecord
  has_many :line_items
  has_many :rates, dependent: :destroy
  belongs_to :category

  validates :name, presence: true, length: {maximum: Settings.name_max_leng}
  validates :price, presence: true, numericality: true
  validates :code, presence: true
  validates :origin, presence: true
  validates :description, presence: true, length: {minimum: Settings.descrip_min}

  mount_uploader :image, ImageUploader
end
