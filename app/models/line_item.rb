class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order, optional: true
  belongs_to :cart
end
