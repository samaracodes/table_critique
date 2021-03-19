class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  belongs_to :category
  has_many :review_categories
  has_many :categories, through: :review_categories
  accepts_nested_attributes_for :restaurant
  accepts_nested_attributes_for :category
  validates :title, :content, presence: true
  


  #scope method
  scope :recently_created, -> { order(created_at: :desc) }
    
  def restaurant_attributes=(restaurant_attributes)
    self.restaurant = Restaurant.find_or_create_by(name: restaurant_attributes[:name])
  end

  def category_attributes=(category_attributes)
      self.category = Category.find_or_create_by(name: category_attributes[:name])
  end

end