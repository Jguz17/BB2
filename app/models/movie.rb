class Movie < ApplicationRecord
    has_many :order_items
    has_many :orders, through: :order_items   
    has_many :movie_genres
    has_many :genres, through: :movie_genres

    
end
