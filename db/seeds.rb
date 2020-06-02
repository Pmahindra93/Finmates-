# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying own_contents..."
OwnContent.destroy_all

puts "Creating article..."
article1 = OwnContent.create!({
  title: '1st article',
  description: 'this is the description of the first article, i.e. it\'\s short abstract',
  article: 'This is the actual article content of the first article',
  category: 'category of first article'
})
