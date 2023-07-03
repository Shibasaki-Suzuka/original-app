class DreamsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    query = "SELECT id,dream_list,cost,due,memo,user_id FROM dreams WHERE user_id = ?"
    @dreams = Dream.find_by_sql([query, current_user])
    count_query = "SELECT COUNT(*) FROM dreams WHERE user_id = ? GROUP BY user_id"
    @dreams_count = Dream.count_by_sql([count_query, current_user])
    achieve_count_query = "SELECT COUNT(*) FROM achieves LEFT JOIN dreams ON dreams.id = achieves.dream_id WHERE dreams.user_id = ? GROUP BY dreams.user_id"
    @achieve_count = Dream.count_by_sql([achieve_count_query, current_user])
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
    @achieve = @dream.achieve
  end

  def edit
    @dream = Dream.find(params[:id])
  end

  def update
    @dream = Dream.find(params[:id])
    if @dream.update(dream_params)
      redirect_to dream_path(@dream)
    else
      render :edit
    end
  end

  private

  def move_to_index
    return if user_signed_in?

    redirect_to new_user_registration_path
  end

  def dream_params
    params.require(:dream).permit(:dream_list, :cost, :due, :memo).merge(user_id: current_user.id)
  end
end
