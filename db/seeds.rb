# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


10.times do |i|
  Post.create!(
    title: "テスト",
    body: "テスト",
    image: "",
    eaten: [true, false].sample,
    smell: [true, false].sample,
    sound: [true, false].sample,
    spill: [true, false].sample,
    category: Post.categories.keys.sample,
    user_id: User.first.id
  )
end
