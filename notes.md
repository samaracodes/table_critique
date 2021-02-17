Restaurant Review App

* Review
    - belongs_to :user
    - belongs_to :restaurant


* User
    - has_many :reviews
    - has_many :reviewed_restaurant, through: :reviews, source: :restaurant


* Category
    - has_many :restaurants



* Restaurant
    - belongs_to :user
    - belongs_to :category
    - has_many :reviews
    - has_many :users, through: reviews

    



