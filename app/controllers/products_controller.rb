class ProductsController < ApplicationController
  def show
    @product = Product.find_by id: params[:id]
    unless @product
      flash[:notice] = t ".cant_find_product"
      redirect_to root_url
    end
    @category = Category.find_by id: @product.category_id
  end
end
