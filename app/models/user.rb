class User < ApplicationRecord
    has_many :orders
    has_many :order_items, through: :orders
    has_secure_password
# https://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html
# https://gist.github.com/iscott/4618dc0c85acb3daa5c26641d8be8d0d

    validates :user_name, presence: true, uniqueness: true
  # def password=(new_pass)
  #   self.password_digest = BCrypt::Password.create(new_pass)
  # end

  # def password
  #   @password ||= BCrypt::Password.new(password_digest)
  # end

  # def authenticate(attempt)
  #   if self.password == attempt
  #     return self
  #   end
  # end
 
    
end