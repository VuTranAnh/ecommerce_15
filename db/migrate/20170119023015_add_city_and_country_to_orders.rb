class AddCityAndCountryToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :city, :string
    add_column :orders, :country, :string
  end
end
