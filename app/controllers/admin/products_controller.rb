class Admin::ProductsController < Admin::ApplicationController
  before_action :load_subcategories, only: [:new, :edit, :update]
  before_action :load_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.order(created_at: :desc)
      .page(params[:page_number]).per Settings.products_per_page
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:notice] = t ".new_product_added"
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update_attributes product_params
      flash[:notice] = t ".updated_successfully"
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = t ".removed_successfully"
    redirect_to admin_products_path
  end

  private
  def product_params
    params.require(:product).permit :name, :code, :origin, :price, :description,
      :category_id, :image
  end

  def load_subcategories
    @subcategories = Category.load_subcategories
  end

  def load_product
    @product = Product.find_by id: params[:id]
    unless @product
      flash[:notice] = t "page_notfound"
      redirect_to admin_products_path
    end
  end
end
