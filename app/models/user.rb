class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_restaurant, through: :reviews, source: :restaurant
    has_many :restaurants

end