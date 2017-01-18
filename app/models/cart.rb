class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_items product, qty
    current_item = line_items.find_or_initialize_by product_id: product.id
    current_item.quantity += qty.to_i
    current_item.price = product.price * current_item.quantity
    current_item.save
  end

  def subtotal
    line_items.pluck(:price).inject(:+)
  end
end
