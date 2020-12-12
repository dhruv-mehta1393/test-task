# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1= User.create(email:"demo@gmail.com", password: 'password', role:'Expert', username:'demo')
user2= User.create(email:"test@gmail.com", password: 'password', role:'Novice', username:'test')