class Restaurant < ApplicationRecord
    belongs_to :review
    has_many :review_categories
    has_many :categories, through: :review_categories


end