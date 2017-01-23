class Product < ApplicationRecord
  has_many :line_items
  has_many :rates, dependent: :destroy
  belongs_to :category

  validates :name, presence: true, length: {maximum: Settings.name_max_leng}
  validates :price, presence: true, numericality: true
  validates :code, presence: true
  validates :origin, presence: true
  validates :description, presence: true, length: {minimum: Settings.descrip_min}

  scope :search, ->category_id, search do
    if search
      if category_id.blank?
        where "name like ?", "%#{search}%"
      else
        where "name like ? AND category_id = ?", "%#{search}%", category_id
      end
    else
      category_id.blank? ? all : where("category_id = ?", category_id)
    end
  end

  mount_uploader :image, ImageUploader
end
