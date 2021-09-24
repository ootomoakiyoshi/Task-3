class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @books = Book.all
    @book = Book.new
    @user = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path

  end


  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
