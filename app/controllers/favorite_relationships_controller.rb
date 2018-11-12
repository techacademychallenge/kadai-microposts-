class FavoriteRelationshipsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = "お気に入りしました。"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:danger] = "お気に入りを外しました。"
    redirect_back(fallback_location: root_path)
  end
end