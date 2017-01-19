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
end
