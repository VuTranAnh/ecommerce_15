class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :subcategories, class_name: Category.name,
    foreign_key: :parent_id, dependent: :destroy
  belongs_to :parent, class_name: Category.name, optional: true

  scope :load_subcategories, ->{where.not parent_id: nil}
end
