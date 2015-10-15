class CollectionsController < ApplicationController

  before_action :logged_in_user
  before_action :correct_user

  def index
    @collections = Collection.where(user_id: current_user.id).paginate(page: params[:page])
  end

  def show
    @items = Collection.where(user_id: current_user.id).find(params[:id]).items
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user_id = current_user.id
    if @collection.save  
      flash[:success] = "New collections set created!"
      redirect_to collections_path
    else
      render 'new'
    end
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  def update
    @collection = Collection.find(params[:id])
    if @collection.update_attributes(collection_params)
      flash[:success] = "Collection updated"
      redirect_to collections_path
    else
      render 'edit'
    end
  end

  def destroy
    Collection.where(:user_id => current_user.id).find(params[:id]).destroy
    flash[:success] = "Collection was deleted."
    redirect_to collections_path
  end


  private

   def collection_params
      params.require(:collection).permit(:name, :description)
   end 

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(current_user.id)
      redirect_to(root_url) unless current_user?(@user)
    end

end
