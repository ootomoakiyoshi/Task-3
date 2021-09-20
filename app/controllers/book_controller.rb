class BookController < ApplicationController

  def new
    @book = Book.new
    @book = Book.all
  end

  def create
  end

  def index
    @books = Book.all
  end

  def show

  end

  def destroy
  end


 private
  def book_params
    params.require(:book).permit(:title,:body)
  end


end
