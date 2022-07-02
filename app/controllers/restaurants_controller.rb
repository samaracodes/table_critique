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
        #@review = Review.find_by_id(params[:restaurant_id])
    end
    
    private
     
    def restaurant_params
        params.require(:restaurant).permit(:name)
    end


end