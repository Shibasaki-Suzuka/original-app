class UsersController < ApplicationController

  def index
    query = "SELECT id,nickname,avatar FROM users"
    @users = User.find_by_sql([query, current_user])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :avatar)
  end
end
