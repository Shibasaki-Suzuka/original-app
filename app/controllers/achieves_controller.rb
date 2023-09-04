class AchievesController < ApplicationController
  before_action :set_dream, only: [:index, :create]

  def index
    @achieve = Achieve.new
  end

  def create
    @achieve = Achieve.new(achieve_params)
    if @achieve.save
      redirect_to dream_path(@achieve.dream)
    end
  end

  private

  def set_dream
    @dream = Dream.find(params[:dream_id])
  end

  def achieve_params
    params.require(:achieve).permit(:image, :success_day, :comment).merge(dream_id: params[:dream_id])
  end
end
