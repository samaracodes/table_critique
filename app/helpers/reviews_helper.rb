module ReviewsHelper

    def create_review_link
        out = ''
        if params[:restaurant_id]
            out << link_to('Create a New Review', new_restaurant_review_path(params[:restaurant_id]))
        else 
            out << link_to('Create a New Review', new_review_path(@review))
        end
        out.html_safe
    end

    def edit_review
        edit = ''

        if current_user == @review.user
            edit << link_to("Edit Review", edit_review_path(@review))
        end
        edit.html_safe
    end
    
    def delete_review
        delete = ''
        if current_user == @review.user 
            delete << link_to("Delete", @question, method: :delete, data: { confirm: "Are you sure?" })
        end
        delete.html_safe
    end

    def show_review(review)
        out = ''
        if params[:restaurant_id] 
            out << link_to(review.title, restaurant_review_path(@restaurant, review.id))
        elsif params[:category_id]
            out << link_to(review.title, category_review_path(@category, review.id))
        elsif params[:user_id]
            out << link_to(review.title, user_review_path(@user, review.id))
        else
            out << link_to(review.title, review)
        end
        out.html_safe
    end


    def homepage_links
        out = ''
        if !current_user
            out << link_to(" Sign Up Here ", signup_path)
            out << "<br><br>"
            
            out << link_to(" Login Here ", '/login')
            out << "<br><br>"
            
            out << button_to(" Log In with Github ", '/auth/github')
        else
            out << link_to(" See All Reviews ", reviews_path)
            out << "<br><br>"
            
            out << link_to(" See All Reviewed Restaurants ", restaurants_path)
            out << "<br><br>"
            
            out << link_to(" See Reviews by Category ", categories_path)
        end
        out.html_safe
    end

end
