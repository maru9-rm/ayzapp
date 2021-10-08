# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

xio = User.create!(email:'xio@example.jp',password:'xiopassword')
lina = User.create!(email:'lina@example.jp',password:'linapassword')

5.times do
    xio.reports.create(
      title: Faker::Lorem.sentence(word_count: 5),
      content: Faker::Lorem.sentence(word_count: 100)
    )
  end

5.times do
  lina.reports.create(
    title: Faker::Lorem.sentence(word_count: 5),
    content: Faker::Lorem.sentence(word_count: 100)
  )
end  