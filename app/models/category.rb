class Category < ApplicationRecord
    has_many :restaurant_categories
    has_many :reviews, through: :restaurant_categories


end