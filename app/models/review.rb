class Review < ApplicationRecord
    belongs_to :user
    belongs_to :restaurant
    has_many :categories, through: :review_categories
    has_many :review_categories, through: :restaurants

    def categories_attributes=(category_attributes)
        category_attributes.values.each do |category_attribute|
            category = Category.find_or_create_by(category_attribute) unless category_attribute[:name].blank?
            self.categories << category if category
        end
    end
    
end