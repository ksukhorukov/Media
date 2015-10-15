class ItemsController < ApplicationController

  before_action :logged_in_user
  before_action :correct_user

  def index
    @items = Item.where(user_id: current_user.id, collection_id: params[:collection_id]).paginate(page: params[:page])
  end

  def show
    @item = Item.where(user_id: current_user.id).find(params[:id])
    @user = User.find(@item.user_id)
  end

  def new
    @collection = Collection.find(params[:collection_id])
    @item = @collection.items.build
    @path = [@collection, @item]
    puts "Collection: {@collection}"
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.collection_id = params[:collection_id]
    if @item.save  
      @collection = Collection.find(params[:collection_id])
      flash[:success] = "New items set created!"
      redirect_to collection_path(params[:collection_id])
    else
      render 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:success] = "Item updated"
      redirect_to @item
    else
      render 'edit'
    end
  end

  def destroy
    Item.where(:user_id => current_user.id).find(params[:id]).destroy
    flash[:success] = "Item was deleted."
    redirect_to items_path
  end


  private

   def item_params
      params.require(:item).permit(:name, :description, :image, :video, :url, :public, :type_id)
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

