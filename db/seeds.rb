# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

### Example of creating 100 test posts
# 100.times do
# 	Post.create(title:'text', body: 'more works')
# end

User.create!(email: 'raq@example.com', password: 'pass123', password_confirmation: 'pass123', admin: true)