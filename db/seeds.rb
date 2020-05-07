# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
# --- Users ---
# john = User.create(user_name: "John1234")
# yann = User.create(user_name: "Yann5678")
# bart = User.create(user_name: "Bart2468")
Movie.destroy_all
# --- Movies ---
hp = Movie.create(title: "Harry Potter")
ae = Movie.create(title: "Avengers: End Game")
lb = Movie.create(title: "Leprechaun 6: Back To Tha Hood")
sr = Movie.create(title: "The Shawshank Redemption")
ff = Movie.create(title: "The Fast and the Furious")
sw = Movie.create(title: "Star Wars")

# # --- Orders ---
# jo = Order.create(user: john)
# yo = Order.create(user: yann)
# bo = Order.create(user: bart)

# --- Order_Item ---
 
# ji = OrderItem.create(order: jo, movie: hp)
# yi = OrderItem.create(order: yo, movie: lb)
# bi = OrderItem.create(order: bo, movie: ae)
Genre.destroy_all
# --- Genre ---

action = Genre.create(name: "Action")
fantasy = Genre.create(name: "Fantasy")
horror = Genre.create(name: "Horror")
romantic = Genre.create(name: "Romantic")
drama = Genre.create(name: "Drama")


# --- Movie_Genre ---

mg1 = MovieGenre.create(movie_id: 1, genre_id: 5)
mg2 = MovieGenre.create(movie_id: 2, genre_id: 4)
mg3 = MovieGenre.create(movie_id: 3, genre_id: 3)
mg4 = MovieGenre.create(movie_id: 4, genre_id: 2)
mg5 = MovieGenre.create(movie_id: 5, genre_id: 1)
mg6 = MovieGenre.create(movie_id: 5, genre_id: 5)

