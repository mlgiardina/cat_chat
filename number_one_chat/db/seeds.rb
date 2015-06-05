Message.create(user_id: 1, chatroom_id: 2, message: "Test 6")
Message.create(user_id: 1, chatroom_id: 2, message: "Test 5")
Message.create(user_id: 1, chatroom_id: 2, message: "Test 4")
Message.create(user_id: 1, chatroom_id: 2, message: "Test 3")
Message.create(user_id: 1, chatroom_id: 2, message: "Test 2")
Message.create(user_id: 1, chatroom_id: 2, message: "Test 1")
User.create(id: 1, name: "Keith")
User.create(id: 2, name: "Matthew")
User.create(id: 3, name: "Kristen")
Chatroom.create(name: "The Living Room")
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
