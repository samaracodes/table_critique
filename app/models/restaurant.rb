class Restaurant < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    belongs_to :review, optional: true
    validates :name, presence: true
    
    

end