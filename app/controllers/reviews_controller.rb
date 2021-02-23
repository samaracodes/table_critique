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
   end
   def create
      @review = current_user.reviews.build(review_params)
      @restaurant = Restaurant.find_or_create_by(name: params[:restaurant_name])
      @category = Category.find_or_create_by(id: params[:category_id])
        #if the post exists in the db
      if @review.save
      #redirect to the show page
         redirect_to reviews_path
         
      else 
         render :new
      end
   end

   def edit
      @review = Review.find(params[:id])

      if @review.user == current_user
         @review = Review.find(params[:id])
      else 
         redirect_to '/'
      end

   end

   def update
      @review = Review.find_by(params[:id])

      if @review.update(review_params)
         flash[:success] = "Review updated!"
         redirect_to review_path(@review)
      else
         render action: :edit
      end
   end

   def destroy
      @review = Review.find(params[:id])
      @review.delete
      redirect_to reviews_path
      flash[:notice] = "The review has been deleted."
   end

   private
   
   def review_params
      params.require(:review).permit(:title, :content, :restaurant_name, category_ids: [], categories_attributes: [:name])
   end

end