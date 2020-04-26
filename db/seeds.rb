# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Authority.create!(id: 1, name: "一般")
Authority.create!(id: 2, name: "管理者")
user = User.create!(nickname:  ENV['nickname'],
  email: ENV['email'],
  password:  ENV['password'],
  password_confirmation: ENV['password_confirmation'],
  authority_id: ENV['authority_id'])
Profile.create!(user_id: user.id,
  appeal: ENV['appeal'])