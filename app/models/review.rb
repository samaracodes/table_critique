class Review < ApplicationRecord
    belongs_to :user
    has_one :restaurant
    has_one :category, through: :restaurants
 
end