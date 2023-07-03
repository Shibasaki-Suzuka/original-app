class AchievesController < ApplicationController
  def index
    @dream = Dream.find(params[:dream_id])
    @achieve = Achieve.new
  end

  def create
    @dream = Dream.find(params[:dream_id])
    @achieve = Achieve.new(achieve_params)
    if @achieve.save
      redirect_to dream_path(@achieve.dream)
    else
      render "/dreams/#{achieve.dream.id}"
    end
  end

  private

  def achieve_params
    params.require(:achieve).permit(:image, :success_day, :comment).merge(user_id: current_user.id, dream_id: params[:dream_id])
  end
end
