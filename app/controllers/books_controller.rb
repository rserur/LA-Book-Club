class BooksController < ApplicationController
  def index
    @books = Book.limit(50)
  end

  def show
    @book = Book.find(params[:id])
    @review = Book.new
    @reviews = @book.reviews
  end
end
