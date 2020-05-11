# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'iepoke@admin.com',
   password: '123456'
)

Category.create(
	user_id: 1,
	name: "肉類"
	)

Category.create(
	user_id: 1,
	name: "魚類"
	)

Category.create(
	user_id: 1,
	name: "野菜"
	)

Category.create(
	user_id: 1,
	name: "果物"
	)