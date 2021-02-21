class Review < ApplicationRecord
    belongs_to :user
    belongs_to :restaurant
    has_many :restaurant_categories
    has_many :categories, through: :restaurant_categories
    accepts_nested_attributes_for :categories


    def categories_attributes=(category_attributes)
        category_attributes.values.each do |category_attribute|
          category = Category.find_or_create_by(category_attribute) unless category_attribute[:name].blank?
          self.categories << category if category
        end
    end

    def restaurant_name=(name)
        self.restaurant = Restaurant.find_or_create_by(name: name)
    end
    
    def restaurant_name
        self.restaurant ? self.restaurant.name : nil
    end
    
end