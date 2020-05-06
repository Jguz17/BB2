class User < ApplicationRecord
    has_secure_password
    has_many :orders
    has_many :order_items, through: :orders
    has_many :movies, through: :order_items


    validates :user_name, uniqueness: true, presence: true


    def user_movies
     self.orders.each do |order|
      order.movies.each do |movie|
        # item.movie.title 
        end
      end
    end
end