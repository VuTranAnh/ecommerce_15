module ApplicationHelper
  def full_title page_title = ""
    base_title = t "ecommerce"
    page_title.blank? ? base_title : "#{page_title} | #{base_title}"
  end

  def flash_class type
    case type
      when "notice" then "info"
      when "danger" then "warning"
    end
  end

  def current_cart
    @cart = Cart.find_by id: session[:cart_id]
    unless @cart
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
    @cart
  end

  def recently_viewed_products
    session[:history].map {|item| Product.find_by id: item} if session[:history]
  end

  def get_pagination_offset
    if params[:page_number].nil? || params[:page_number].to_i <= 1
      paginate_offset = 0
    else
      paginate_offset = (params[:page_number].to_i - 1) * 50
    end
  end

  def admin_section?
    controller.class.parent == Admin
  end

  def custom_display subcategories
    subcategories.map {|c| ["#{c.parent.name} > #{c.name}", c.id]}
  end
end
