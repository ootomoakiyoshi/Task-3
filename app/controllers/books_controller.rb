class BooksController < ApplicationController
    before_action :authenticate_user!

  def new
    @book = Book.new
    @book = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if
     @book.save
      flash[:notice] = "You have created book successfully.." #フラッシュ文リダイレクと前に
      redirect_to book_path(@book.id)
    else
      @books=Book.all
      @user = current_user
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @users = User.all
    @user = current_user
  end
  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @newbook = Book.new
  end

   def edit
    @book = Book.find(params[:id])
    if current_user.id != @book.user.id
     redirect_to books_path
    end
    @user = current_user
   end

   def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:success] = "You have updated book successfully"
     redirect_to book_path(@book.id)
    else
       @user = current_user
       render :edit
    end
   end

   def destroy
    @book =Book.find(params[:id])
    @book.destroy
    redirect_to books_path
   end


 private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end