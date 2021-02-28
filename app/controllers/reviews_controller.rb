class ReviewsController < ApplicationController
   before_action :redirect_if_not_logged_in

   def index
      @reviews = Review.all.recently_created
   end

   def show
      @review = Review.find_by_id(params[:id])
   end

   def new
      @review = Review.new
      @review.build_restaurant
   end

   def create
      @review = current_user.reviews.new(review_params)
      #if the post exists in the db
      if @review.valid?
         @review.save
      #redirect to the show page
         redirect_to reviews_path
      else 
         render :new
      end
   end

   def edit
      @review = Review.find(params[:id])

   end

   def update
      if logged_in?
         @review = Review.find_by(params[:id])
         @review.update(review_params)
         flash[:success] = "Review updated!"
         redirect_to review_path(@review)
      else
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
      params.require(:review).permit(:title, :content, restaurant_attributes: [:name, category_id: []])
   end

end