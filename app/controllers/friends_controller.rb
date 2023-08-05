class FriendsController < ApplicationController
  def create
    follow = current_user.active_friends.new(follower_id: params[:user_id])
    follow.save
    redirect_to root_path
  end

  def destroy
    follow = current_user.active_friends.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_to root_path
  end
end
