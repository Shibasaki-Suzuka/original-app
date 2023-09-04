class LikesController < ApplicationController
  before_action :set_dream, only: [:create, :destroy]

  def create
    like = current_user.likes.build(dream_id: params[:dream_id])
    like.save
    render 'create.js.erb'
  end

  def destroy
    like = Like.find_by(dream_id: params[:dream_id], user_id: current_user.id)
    like.destroy
    render 'destroy.js.erb'
  end

  def set_dream
    @dream = Dream.find(params[:dream_id])
  end
end
