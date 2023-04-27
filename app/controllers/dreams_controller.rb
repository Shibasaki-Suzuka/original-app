class DreamsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @dreams = Dream.includes(:user)
  end

  def new
    @dream = Dream.new
  end

  def create
    @dream = Dream.new(dream_params)
    if @dream.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @dream = Dream.find(params[:id])
  end

  def edit
    @dream = Dream.find(params[:id])
  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to new_user_registration_path
    end
  end

  def dream_params
    params.require(:dream).permit(:dream_list, :cost, :due, :memo).merge(user_id: current_user.id)
  end
end
