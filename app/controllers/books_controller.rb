class BooksController < ApplicationController
  def index
    @books = Book.limit(50)
  end

  def show
    @book = Book.find(params[:id])
    @review = Review.new
    @reviews = @book.reviews
  end

  def new
    @book = Book.new
    @book.author = Author.new
  end

  def create
    @book = Book.new(book_params)

    if new_author = Author.find_by(first_name: @book.author.first_name, last_name: @book.author.last_name)
      @book.author = new_author
      @notice = 'Book successfully created with existing author.'
    else
      @notice = 'Book successfully created with new author.'
    end

    if @book.save
      redirect_to @book, notice: @notice
    else
      render :new, notice: "Your book and/or author couldn't be saved."
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :year, :description, :category_id,
      author_attributes: [ :first_name, :last_name ] )
  end

end
