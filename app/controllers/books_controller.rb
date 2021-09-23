class BooksController < ApplicationController
  def new
    @book = Book.new
    @book = Book.all
  end

  def create
    @book = Book.new(book_params)
   if @book.save
      flash[:notice] = "Book was successfully created." #フラッシュ文リダイレクと前に
      redirect_to book_path(@book.id)
   else
      @books=Book.all
      render :index
   end
  end

  def index
    @books = Book.all
  end

  # def show
  # end

  # def destroy
  # end


 private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
