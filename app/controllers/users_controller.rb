class UsersController < ApplicationController
  before_action :authenticate_user!
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @newbook = Book.new
    @books = @user.books

  end
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  def index
    @users = User.all
    @user = current_user
    @newbook = Book.new
    @book = Book.new
  end

private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
