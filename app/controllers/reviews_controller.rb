class ReviewsController < ApplicationController
    def index 
        @user = User.find(current_user)
        @reviews = Review.all 
        @new_review = Review.new 
      end 
    
      def new 
        @new_review = Review.new 
        @user = User.find_by(current_user)
      end 
    
      def create 
        @review = Review.new(review_params)
        if @review.save 
          redirect_to @review
        else 
          redirect_to reviews_path
        end 
      end 
    
      def show 
        @user = User.find(current_user)
        @review= Review.find_by(id: params[:id])
      end 
    
      def edit 
        @new_review = Review.find_by(id: params[:id])
        @user = User.find(current_user)
      end 
    
      def update 
        @review = Review.find_by(id: params[:id])
        @review.update(review_params)
    
        redirect_to review_path(@review)
      end 
    
    
      private 
    
      def review_params
        params.require(:review).permit(:title, :content)
      end 
    

end