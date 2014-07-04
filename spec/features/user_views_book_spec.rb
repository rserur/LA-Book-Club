require 'rails_helper'

feature 'user views book show page' do

  scenario '.all book details are displayed' do

    book = FactoryGirl.create(:book)

    visit book_path(book.id)

    expect(page).to have_content(book.title, book.author, book.description, book.category)

  end

    scenario '.book reviews display on show page' do

    review = FactoryGirl.create(:review)

    visit book_path(review.book.id)

    expect(page).to have_content(review.rating, review.body, book.title)

  end

end
