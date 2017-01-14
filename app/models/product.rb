class Product < ApplicationRecord
  has_many :line_items
  has_many :rates, dependent: :destroy
end
