class Product < ApplicationRecord
  has_many :line_items
  has_many :rates, dependent: :destroy
  belongs_to :category

  mount_uploader :image, ImageUploader
end
