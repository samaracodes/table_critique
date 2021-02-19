class Category < ApplicationRecord
    has_many :review_categories
    has_many :restaurants, through: :review_categories


end