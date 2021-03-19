class Restaurant < ApplicationRecord
    has_many :users, through: :reviews
    has_many :reviews
    belongs_to :review, optional: true
    validates :name, presence: true
    
    

end