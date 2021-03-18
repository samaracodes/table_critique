class RestaurantsController < ApplicationController 

    def index
        if params[:search]
            @restaurants = Restaurant.where('name LIKE ?', "%#{params[:search]}%")
        else
            @restaurants = Restaurant.all
        end
    end


    def show
        @restaurant = Restaurant.find_by_id(params[:id])
    end

    def reviews_index
        @restaurant = Restaurant.find_by(params[:id])
        @review = @restaurant.reviews
        render template: 'reviews/index'
    end

    def review
        @restaurant= Restaurant.find(params[:id])
     
        # Note that because ids are unique by table we can go directly to
        # Review.find — no need for @user.reviews.find...
        @review = Review.find(params[:review_id])
        render template: 'reviews/show'
    end

  
    private
     
    def restaurant_params
        params.require(:restaurant).permit(:name, :search, category_ids: [], categories_attributes: [:name])
    end


end