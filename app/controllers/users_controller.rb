class UsersController < ApplicationController
  before_action :authenticate_user!
   before_action :ensure_current_user, {only: [:edit]}

  def ensure_current_user
  if current_user.id != params[:id].to_i
    redirect_to user_path(current_user)
  end
  end

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
    if @user.update(user_params)
     redirect_to user_path(@user.id), notice:"You have updated user successfully."
    else
      @users = current_user
      render :edit
    end
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
