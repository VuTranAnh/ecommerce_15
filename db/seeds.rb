parent_categories = %w(books clothing laptop camera tv)
book_subcategories = %w(novel fiction education history comics)
clothing_subcategories = %w(men women accessories)
laptop_subcategories = %w(apple samsung hp dell lenovo)
camera_subcategories = %w(canon nikon sony fujifilm gopro)
tv_subcategories = %w(samsung lg sony panasonic toshiba)
all_subcategories = [book_subcategories, clothing_subcategories,
  laptop_subcategories, camera_subcategories, tv_subcategories]

parent_categories.each.with_index do |parent, i|
  puts "Creating #{parent} category.."
  parent_category = Category.create! name: parent
  puts "Done."
  all_subcategories[i].each do |subcategory|
    puts "Creating #{parent} subcategories.."
    parent_category.subcategories.create! name: subcategory
    puts "Done.."
  end
end

subcategories_ids = Category.where.not(parent_id: nil).pluck(:id)
subcategories_ids.each do |subcategory_id|
  100.times do
    Product.create!(name: Faker::Commerce.product_name,
      description: Faker::Lorem.paragraph(rand(60..80)),
      price: Faker::Commerce.price, code: Faker::Code.asin,
      origin: Faker::Address.country, category_id: subcategory_id)
  end
end

unless User.exists? email: "admin@mail.com"
  User.create! name: "TRAN ANH VU", email: "admin@mail.com",
    password: "password", password_confirmation: "password", is_admin: true,
    address: "45 Dong Ke", phone: "1234567898"
end
