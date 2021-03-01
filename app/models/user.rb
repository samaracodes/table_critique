class User < ApplicationRecord
    has_many :reviews
    has_secure_password #authenticate, validate
    validates :username, presence: true
    validates :username, uniqueness: 
    {message: ': An account associated with %{value} already exists'}

  

end