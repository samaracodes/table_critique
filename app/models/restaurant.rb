class Restaurant < ApplicationRecord
    has_many :users, through: :reviews
    has_many :reviews
    belongs_to :category
    belongs_to :user

end