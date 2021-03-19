class Review < ApplicationRecord
  has_many :review_categories
  has_many :categories, through: :review_categories
  belongs_to :user
  belongs_to :restaurant
  
  has_many :restaurants, through: :reviews
  accepts_nested_attributes_for :restaurant
  #accepts_nested_attributes_for :categories
  validates :title, :content, presence: true
  


  #scope method
  scope :recently_created, -> { order(created_at: :desc) }
    
  def restaurant_attributes=(restaurant_attributes)
    self.restaurant = Restaurant.find_or_create_by(name: restaurant_attributes[:name])
  end

  def category_attributes=(category_attributes)
    category = Category.find_or_create_by(category_attributes) unless category_attribute[:name].blank?
    self.categories << category if category
  end

end