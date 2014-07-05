class ReviewsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    @book = Book.find(params[:book_id])

    @review = Review.new(review_params)

    @review.book = @book

    if @review.save
      redirect_to book_path(@book), notice: 'Review successfully created.'
    else
      render 'books/show'
    end
  end

  def review_params
    params.require(:review).permit(:body, :rating)
  end

end
