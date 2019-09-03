5.times do |n|
  name  = Faker::Name.name
  Category.create!(name: name)
end

10.times do |n|
  name  = Faker::Name.name
  Tag.create!(name: name)
end

10.times do |n|
  email = "test_#{n}@example.com"
  name = "Test User"
  phone = "555555555"
  address = "123 Wall Street"
  password = "123123"
  picture = File.open(Rails.root.join("app", "assets", "images", "test.jpg"))
  User.create!(email: email, name: name, phone: phone, address: address,
    password: password, picture: picture)
end

puts "10 users has been created"
