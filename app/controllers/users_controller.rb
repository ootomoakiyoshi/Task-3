class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to user_path
  end

  def index
    @user = user.all
  end
private

  def post_user_params
    params.require(:user).permit(:shop_name, :image, :caption)
  end
end
