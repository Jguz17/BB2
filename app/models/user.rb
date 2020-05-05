class User < ApplicationRecord
    has_many :orders
    has_many :order_items, through: :orders

    
    validates :user_name, uniqueness: true, presence: true
 
    
end