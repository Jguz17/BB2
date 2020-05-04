# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# --- Users ---
john = User.create(user_name: "John1234")
yann = User.create(user_name: "Yann5678")
bart = User.create(user_name: "Bart2468")

# --- Movies ---
hp = Movie.create(title: "Harry Potter")
ae = Movie.create(title: "Avengers: End Game")
lb = Movie.create(title: "Leprechaun 6: Back To Tha Hood")

# --- Orders ---
jo = Order.create(user: john)
yo = Order.create(user: yann)
bo = Order.create(user: bart)

# --- Order_Item ---
 
ji = OrderItem.create(order: jo, movie: hp)
yi = OrderItem.create(order: yo, movie: lb)
bi = OrderItem.create(order: bo, movie: ae)