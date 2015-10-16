class RouterController < ApplicationController

  def show
    @item = Item.find(params[:id])
    unless @item.nil? 
      if @item.public?
        @user = User.find(@item.user_id)
        render :template => "items/show"
      else
        redirect item_path(@item)
      end
    else
      redirect root_path
    end
  end

end
