class BooksController < ApplicationController
  def new
    @book = Book.new
    @book = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if
     @book.save
      flash[:notice] = "Book was successfully created." #フラッシュ文リダイレクと前に
      redirect_to book_path(@book.id)
    else
      @books=Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

   def show
    @users = User.all
    @newbook = Book.new
    @user = current_user
    @book = Book.find(params[:id])
   end

   def edit
    @book = Book.find(params[:id])
    @user = current_user
   end

   def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@user.id)
   end

  # def destroy
  # end


 private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
