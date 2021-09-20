class Book < ApplicationRecord
 belongs_to :user
 attachment :image
end

def create
book = Book.new(list_params)
book.save
redirect_to '/books'
end