class Restaurant < ApplicationRecord
    has_many :reviews
    has_many :restaurant_categories
    has_many :categories, through: :restaurant_categories
    validates :name, :category_id, presence: true
    
    def self.search(search)
        if search.present?
            where('name LIKE ?', "%#{search}%")
        else
            where(true)
        end
    end

end