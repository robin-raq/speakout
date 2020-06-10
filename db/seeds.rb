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
User.destroy_all()
Post.destroy_all()

User.create!(email: 'raq@example.com', password: 'pass123', password_confirmation: 'pass123', admin: true)

25.times do |i|
	post = Post.new
	post.title = Faker::Lorem.sentence(word_count: 3, random_words_to_add: 7)
	post.body = Faker::Lorem.paragraph_by_chars(number:500)
	post.user = User.first
	post.thumbnail.attach(io: open("https://picsum.photos/1920/1080/?blur"), filename: "#{i}_thumnail.jpeg")
	post.banner.attach(io: open("https://picsum.photos/1920/1080/?grayscale"), filename: "#{i}_banner.jpeg")
	post.views = Faker::Number.between(from: 1, to: 5000)
	post.save
end