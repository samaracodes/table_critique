class CategoriesController < ApplicationController
    def show
        @category = Category.find(params[:id])
    end

    def index
        if params[:restaurant_id]
            #nested
            @restaurant = Restaurant.find_by_id(params[:restaurant_id])
            if @restaurant
                @category = @restaurant.category
            else
                flash[:message] = "That restaurant doesn't exist"
                @restaurants = Restaurant.all
            end
        else 
            @restaurants = Restaurant.all

        end
    end
  
     def new
        @category = Category.new
     end
  
     def create
        @category = Category.find_or_create_by(restaurant_params)
     end
  
     private
     
     def category_params
        params.require(:category).permit(:name, restaurant_ids: [])
     end    


end