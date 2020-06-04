# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying own_contents..."
OwnContent.destroy_all

puts "Creating article 1..."
article1 = OwnContent.create!({
  title: '1st article',
  description: 'This is the description of the first article, i.e. its short abstract',
  article: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis lectus ut arcu dignissim pharetra. Nunc ut quam consectetur, vehicula nisl sed, tincidunt enim. Curabitur malesuada at orci vitae volutpat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum sodales commodo ex ut molestie. Etiam consequat, elit nec euismod facilisis, neque eros vulputate arcu, eget luctus sem magna lacinia nulla. Proin vel mattis justo, sed cursus orci. Integer egestas vel metus bibendum imperdiet. Morbi consectetur cursus leo, non luctus velit ultrices a.',
  category: 'category of first article'
})

puts "Creating article 2..."
article2 = OwnContent.create!({
  title: '2nd article',
  description: 'This is the description of the second article, i.e. its short abstract',
  article: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis lectus ut arcu dignissim pharetra. Nunc ut quam consectetur, vehicula nisl sed, tincidunt enim. Curabitur malesuada at orci vitae volutpat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum sodales commodo ex ut molestie. Etiam consequat, elit nec euismod facilisis, neque eros vulputate arcu, eget luctus sem magna lacinia nulla. Proin vel mattis justo, sed cursus orci. Integer egestas vel metus bibendum imperdiet. Morbi consectetur cursus leo, non luctus velit ultrices a.',
  category: 'category of second article'
})

puts "Creating article 3..."
article3 = OwnContent.create!({
  title: '3rd article',
  description: 'This is the description of the third article, i.e. its short abstract',
  article: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis lectus ut arcu dignissim pharetra. Nunc ut quam consectetur, vehicula nisl sed, tincidunt enim. Curabitur malesuada at orci vitae volutpat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum sodales commodo ex ut molestie. Etiam consequat, elit nec euismod facilisis, neque eros vulputate arcu, eget luctus sem magna lacinia nulla. Proin vel mattis justo, sed cursus orci. Integer egestas vel metus bibendum imperdiet. Morbi consectetur cursus leo, non luctus velit ultrices a.',
  category: 'category of third article'
})

puts "Finished"
