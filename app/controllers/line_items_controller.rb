class LineItemsController < ApplicationController
  before_action :current_cart
  before_action :load_item, only: [:update, :destroy]

  def create
    product = Product.find_by id: params[:product_id]
    @line_item = @cart.add_items product, params[:qty]
    flash[:notice] = t(".added_to_cart", product_name: product.name)
    redirect_to root_url
  end

  def update
    @line_item.quantity = params[:line_item][:quantity]
    @line_item.price = @line_item.quantity * @line_item.product.price
    @line_item.save
    redirect_to @cart
  end

  def destroy
    @line_item.destroy
  end

  private
  def line_item_params
    params.require(:line_item).permit :quantity, :price
  end

  def load_item
    @line_item = LineItem.find_by id: params[:id]
    unless @line_item
      flash[:danger] = t ".cant_find_item"
      redirect_to root_url
    end
  end
end
