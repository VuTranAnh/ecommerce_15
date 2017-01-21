class ProductsController < ApplicationController
  before_action :store_recently_viewed

  def show
    @product = Product.find_by id: params[:id]
    if @product.nil?
      flash[:notice] = t ".cant_find_product"
      redirect_to root_url
    else
      @category = Category.find_by id: @product.category_id
    end
  end
end
