class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :user

  validates :full_name, presence: true, length: {maximum: Settings.name_max_leng}
  validates :phone, presence: true, length: {minimum: Settings.phone_min_leng,
    maximum: Settings.phone_max_leng}, numericality: true
  validates :address, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :payment_method, presence: true

  enum payment_method: [:credit_card, :cod]
  enum status: [:pending, :approved, :rejected, :finished]

  scope :history_orders, ->status{where(status: status).order created_at: :desc}

  def add_cart_items cart
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
