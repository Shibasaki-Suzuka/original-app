class AchievesController < ApplicationController

  def new
    @dream = Dream.find(params[:dream_id])
  end

  def create
    @dream = Dream.find(params[:dream_id])
    @achieve = Achieve.new(achieve_params)
    @achieves = @dream.comments.includes(:user)
    if @achieve.save
      redirect_to dream_path(@achieve.dream)
    else
      render "achieve/new"
    end
  end

  private
  def achieve_params
    params.require(:achieve).permit(:success_day, :comment, :image).merge(user_id: current_user.id, dream_id: params[:dream_id])
  end
end
