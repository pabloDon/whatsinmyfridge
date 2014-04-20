class FavoritesController < ApplicationController
  def switch
    favorite = Favorite.where(:user_id => current_user.id, :recipe_id => params[:recipe]).first
    if favorite
      favorite.destroy 
    else
      favorite = Favorite.new user_id:current_user.id, recipe_id: params[:recipe]
      favorite.save
    end
    render :nothing => true
  end
end
