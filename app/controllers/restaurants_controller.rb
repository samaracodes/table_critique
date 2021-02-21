class RestaurantsController < ApplicationController 

    def show
        @restaurant = Restaurant.find_by(params[:restaurant_id])
        @reviews = Review.find_by(params[:restaurant_id])
     end
     
    def index
        @restaurants = Restaurant.all
    end
  
     def new
        @restaurant = Restaurant.new
     end
  
     def create
        @restaurant = Restaurant.create(restaurant_params)
     end
  
     private
     
     def restaurant_params
        params.require(:restaurant).permit(:name)
     end


end