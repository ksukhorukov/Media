class SearchController < ApplicationController

  def create
    search = params[:word]
    wildcard_search = "%#{search}%"
    public_posts = Item.where("name LIKE :search OR description LIKE :search AND public = 1", search: wildcard_search)
    own = Item.where("name LIKE :search OR description LIKE :search AND public = 1 AND user_id = :user_id", { search: wildcard_search, user_id: current_user.id })
    ids = public_posts.ids + own.ids
    @result = Item.where(:id => ids)
  end
  
end
