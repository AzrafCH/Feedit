# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  5.times do
    User.create(username: Faker::FunnyName.unique.name, password: " ", email: " ")
  end

  5.times do
    Subfed.create(title: Faker::Marketing.buzzwords, content: Faker::Science.scientist)
  end

  5.times do
    Post.create(title: Faker::Quotes::Shakespeare.as_you_like_it_quote, summary: Faker::Movies::StarWars.wookiee_sentence, subfed_id: Subfed.all.sample.id)
  end
