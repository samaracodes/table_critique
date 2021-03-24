class CategoriesController < ApplicationController

    def index
        if params[:review_id]
            @categories = Review.find_by(params[:review_id]).categories
        else
            @categories = Category.all
        end
    end

    def show
        @category = Category.find_by_id(params[:id])
    end
     
    private
     
    def category_params
        params.require(:category).permit(:name, :category_ids)
    end

end