class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :rates, dependent: :destroy
end
