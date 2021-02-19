class RestaurantsController < ApplicationController 

    def index
        if params[:review_id]
            #nested
            @review = Review.find_by_id(params[:review_id])
            if @review
                @restaurant = @review.restaurant
            else
                flash[:message] = "That review doesn't exist"
                @restaurants = Restaurant.all
            end
        else 
            @restaurants = Restaurant.all

        end
    end


end