class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_restaurant, through: :reviews
    has_many :restaurants
    has_secure_password #authenticate, validate

end