# User.create! name: "phuong", email: "thaiphuong1@gmail.com",
#   password: "123123", password_confirmation: "123123",
#   avatar: "avatar.png", phone: "03434343", role: 2
#
# User.create! name: "User 2", email: "thaiphuong2@gmail.com",
#              password: "123123", password_confirmation: "123123",
#              avatar: "avatar.png", phone: "97434343", role: 1

#
# 20.times do |n|
#   _name = "phuong"
#   _pass = "123123"
#   _email = "example-#{n+1}@railstutorial.org"
#   User.create! name: _name, email: _email,
#     password: _pass, password_confirmation: _pass,
#     avatar: "avatar.png", phone: "3493473743", role: 0
# end
#  n = 10
# 20.times do |n|
#   name = Faker::Book.genre
#   description = Faker::Lorem.sentence(3, true, 4)
#   Category.create!(name: name, description: description)
# end


# 20.times do |n|
#   name = Faker::GameOfThrones.character
#   description = Faker::Lorem.sentence(3, true, 4)
#   Author.create!(name: name, description: description)
# end
#
#  authors = Author.all
# n = 3
#  3.times do |n|
#   name = Faker::Name.name
#   description = Faker::Lorem.sentence(3, true, 4)
#   authors.each { |author| author.book_items.create!(book_id: 2)
#                                                          }
# end

users = User.all
n = 3
3.times do |n|
 users.each { |users| users.requests.create!(start_day: "2017-01-10", end_day: "2017-01-17")
                                                        }
end


#  10.times do |n|
#   name  = Faker::Name.name
#   description = Faker::Lorem.sentence(3, true, 4)
#   Category.create!(name: name, description: description)
# end

# 10.times do |n|
#   name  = Faker::Name.name
#   description = Faker::Lorem.sentence(3, true, 4)
#   Category.create!(name: name, description: description)
# end
# n = 5
# categorys = Category.all

# 10.times do |n|
#   name = Faker::Name.name
#   description = Faker::Lorem.sentence(3, true, 4)
#   categorys.each { |category| category.books.create!(title: name,
#                                                         description: description,
#                                                         image: "book.png",
#                                                         numper_page: 100,
#                                                         publisher_id: 1)
#                                                          }
# end
# n = 10
# 20.times do |n|
#   publiser_name = Faker::Company.name
#   description = Faker::Lorem.sentence(3, true, 4)
#   email = Faker::Internet.email
#   street_address = Faker::Address.street_address
#   city = Faker::Address.city
#   street_name = Faker::Address.street_name
#   country = Faker::Address.country
#   address = "#{street_address}, #{street_name}, #{city}, #{country}"
#   Publisher.create!(name: publiser_name, description: description, email: email,
#     phone: "2323232323", address: address)
# end
