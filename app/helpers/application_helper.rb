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
end
