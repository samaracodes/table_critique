class RestaurantsController < ApplicationController 

    def index
        if params[:search]
            @user = User.search(params[:search])
         end
        @restaurants = Restaurant.all
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