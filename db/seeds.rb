# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#  User.destroy_all
#  Subfed.destroy_all
#  Post.destroy_all
#  Forum.destroy_all


#   user = User.create(username: Faker::FunnyName.unique.name, password: " ", email: " ")
#   subfed =  Subfed.create(title: Faker::Quotes::Shakespeare.king_richard_iii_quote, content: Faker::Science.scientist)
#   post =  Post.create(title: Faker::Quotes::Shakespeare.as_you_like_it_quote, summary: Faker::Movies::StarWars.wookiee_sentence)

#   Forum.create(user_id: user.id, subfed_id: subfed.id, post_id: post.id)

Frank = User.create(username: "Frank", email: "f", password: "f")
Mary = User.create(username: "Mary", email: "m", password: "m")
Jerry = User.create(username: "Jerry", email: "j", password: "j")

Subfed1 = Subfed.create(title: "This is The First Category", content: "This is a description of the first Category")
Subfed2 = Subfed.create(title: "This is The Second Category", content: "This is a description of the Second Category")

Post1 = Post.create(title: "This is the first Post belonging to First Category", summary: "This is the summary of the First post belonging to First category/subfed")
Post2 = Post.create(title: "This is the Second Post belonging to First Category", summary: "This is the summary of the Second post belonging to First category/subfed")
Post3 = Post.create(title: "This is the First Post belonging to Second Category", summary: "This is the summary of the First post belonging to Second category/subfed")
Post4 = Post.create(title: "This is the Second Post belonging to Second Category", summary: "This is the summary of the Second post belonging to Second category/subfed")

Frank.posts << [Post1, Post2]
Mary.posts << Post3
Jerry.posts << Post4

Post1.users << Frank
Post2.users << Frank
Post3.users << Mary
Post4.users << Jerry

Subfed1.posts << [Post1, Post2]
Subfed2.posts << [Post3, Post4]
