class Restaurant < ApplicationRecord
    has_many :reviews
    has_many :review_categories
    has_many :categories, through: :review_categories


end