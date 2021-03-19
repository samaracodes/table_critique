class ReviewsController < ApplicationController
   before_action :redirect_if_not_logged_in

   def index
      if params[:restaurant_id]
         @reviews = Restaurant.find_by_id(params[:restaurant_id]).reviews 
      else
         @reviews = Review.recently_created
      end
   end

   def show
      @review = Review.find_by_id(params[:id])
   end

   def new
      @review = Review.new
      @review.build_restaurant
      @review.build_category
   end

   def create
      @review = current_user.reviews.new(review_params)
      



      #if the post exists in the db
      if @review.valid?
         @review.save
      #redirect to the show page
         redirect_to reviews_path
      else 
         flash[:message] = "Incorrect credentials, please try again"
         render :new
      end
   end

   def edit
      @review = Review.find_by_id(params[:id])

   end

   def update
      if logged_in?
         @review = Review.find_by_id(params[:id])
         @review.update(review_params)
         flash[:message] = "Review updated!"
         redirect_to review_path(@review)
      else
         flash[:message] = "Incorrect credentials, please try again"
         render action: :edit
      end
   end

   def destroy
      @review = current_user.reviews.find(params[:id])
      @review.destroy
      redirect_to reviews_path
      flash[:notice] = "The review has been deleted."
   end

   private
   
   def review_params
      params.require(:review).permit(:title, :content, restaurant_attributes:[:name, :id], category_attributes:[:name])
   end

end