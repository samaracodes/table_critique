class RestaurantsController < ApplicationController 


    def index
        if params[:review_id]
            @restaurants = Review.find(params[:review_id]).restaurants
        elsif params[:search]
            @restaurants = Restaurant.where('name LIKE ?', "%#{params[:search]}%")
        else
            @restaurants = Restaurant.all
        end
    end


    def show
        @restaurant = Restaurant.find_by_id(params[:id])
    end

    #
  
    private
     
    def restaurant_params
        params.require(:restaurant).permit(:name)
    end


end