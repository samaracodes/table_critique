class ReviewsController < ApplicationController
   before_action :redirect_if_not_logged_in

   def index
      @reviews = Review.all.order("created_at DESC")
   end

   def new
      @review = Review.new
   end

   def create
      @review = current_user.reviews.build(review_params)
        #if the post exists in the db
      if @review.save
      #redirect to the show page
         
         redirect_to reviews_path
      else 
         render :new
      end
   end

   def show
      @review = Review.find_by(params[:id])
   end

   private
   
   def review_params
      params.require(:review).permit(:title, :content)
   end
end