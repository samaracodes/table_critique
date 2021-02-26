class Review < ApplicationRecord
    belongs_to :user
    belongs_to :restaurant

    #scope method
    scope :recently_created, -> { order(created_at: :desc) }
    

  def restaurant_attributes=(restaurant_attributes)
    self.restaurant = Restaurant.find_or_create_by(name: restaurant_attributes[:name]) do |r|
        r.category_id = restaurant_attributes[:category_id]
    end
  end
end