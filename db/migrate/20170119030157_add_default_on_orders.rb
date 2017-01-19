class AddDefaultOnOrders < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :payment_method, :integer, default: 0, null: false
    change_column :orders, :status, :integer, default: 0, null: false
  end
end
