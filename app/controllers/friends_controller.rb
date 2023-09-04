class FriendsController < ApplicationController
  before_action :set_user, only: [:create, :destroy]

  def create
    follow = current_user.active_friends.new(follower_id: params[:user_id])
    follow.save
    render 'create.js.erb'
  end

  def destroy
    follow = current_user.active_friends.find_by(follower_id: params[:user_id])
    follow.destroy
    render 'destroy.js.erb'
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
