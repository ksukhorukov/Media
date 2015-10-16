class SearchController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def create
    search = params[:word]
    wildcard_search = "%#{search}%"
    public_posts = Item.where("name LIKE :search OR description LIKE :search", search: wildcard_search).where(:public => true)
   
    if logged_in?
      own = Item.where("name LIKE :search OR description LIKE :search AND public = 1 AND user_id = :user_id", { search: wildcard_search, user_id: current_user.id  })
      ids = public_posts.ids + own.ids
    else
      ids = public_posts.ids 
    end

    @result = Item.where(:id => ids)

    respond_to do |format|
      format.html
      format.json
    end

  end
  
end
