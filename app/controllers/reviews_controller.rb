class ReviewsController < ApplicationController
   before_action :redirect_if_not_logged_in

   def index
      if params[:restaurant_id] && @restaurant = Restaurant.find_by_id(params[:restaurant_id])
         @reviews = @restaurant.reviews
      elsif params[:category_id] && @category = Category.find_by_id(params[:category_id])
         @reviews = @category.reviews
      elsif params[:user_id]
         @reviews = User.find_by_id(params[:user_id]).reviews
      else
         @reviews = Review.recently_created
      end
   end

   def show
         @review = Review.find_by_id(params[:id])
      
   end

   def new
      if params[:restaurant_id] && @restaurant = Restaurant.find_by_id(params[:restaurant_id])
         @review = @restaurant.reviews.build
      elsif params[:category_id] && @category = Category.find_by_id(params[:category_id])
         @review = @category.reviews.build
      else
         @review = Review.new
         @review.build_restaurant
      
      end
   end

   def create
      @review = current_user.reviews.new(review_params)
      

      #if the post exists in the db
      if @review.valid?
         @review.save
      #redirect to the reviews index page
         redirect_to reviews_path
      else 
         flash[:message] = "Incorrect credentials, please try again"
         render :new
      end
   end

   def edit
      
      @review = current_user.reviews.find_by_id(params[:id])

   end

   def update
         if @review = current_user.reviews.find_by_id(params[:id])
            @review.update(review_params)
            flash[:message] = "Review updated!"
            redirect_to review_path(@review)
         else
            render :login 
         end
   end

   def destroy
      if @review = current_user.reviews.find_by_id(params[:id]) 
         @review.destroy
         redirect_to reviews_path
         flash[:notice] = "The review has been deleted."
      else
         render :home
      end
   end

   private
   
   def review_params
      params.require(:review).permit(:title, :content, :category_ids, restaurant_attributes:[:name, :id], category_attributes:[:name, :id])
   end

end