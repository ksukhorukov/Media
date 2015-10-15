class PublicController < ApplicationController

  def index
    @results = Item.where(:public => true).paginate(page: params[:page])
  end

end
