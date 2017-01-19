class OrdersController < ApplicationController
  before_action :current_cart
  before_action :logged_in_user

  def new
    @order = current_user.orders.build
    if @cart.line_items.empty?
      flash[:notice] = t ".your_cart_is_empty"
      redirect_to @cart
    end
  end

  def create
    @order = current_user.orders.build order_params
    @order.total = @cart.subtotal
    @order.add_cart_items @cart
    if @order.save
      flash[:notice] = t ".order_successfully"
      redirect_to root_url
    else
      render :new
    end
  end

  private
  def order_params
    params.require(:order).permit :full_name, :address, :phone, :city, :country,
      :payment_method
  end
end
