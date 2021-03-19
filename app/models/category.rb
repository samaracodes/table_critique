class Category < ApplicationRecord
    has_many :reviews
    has_many :review_categories
    has_many :reviews, through: :review_categories
    belongs_to :review, optional: true
    validates :name, presence: true


    

end