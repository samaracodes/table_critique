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

    def new
        @restaurant = Restaurant.new
     end
  
    private
     
    def restaurant_params
        params.require(:restaurant).permit(:name, :search, category_ids: [], categories_attributes: [:name])
    end


end