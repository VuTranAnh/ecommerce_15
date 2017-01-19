class StaticPagesController < ApplicationController
  before_action :current_cart

  def show
    if valid_page?
      @products = Product.order(created_at: :desc)
        .page(params[:page_number]).per Settings.products_per_page
      render "static_pages/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private
  def valid_page?
    File.exist? Pathname.new(Rails.root +
      "app/views/static_pages/#{params[:page]}.html.erb")
  end
end
