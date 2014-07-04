require 'rails_helper'

feature 'user views booklist' do

  scenario '.all books appear in list' do

    first_book = FactoryGirl.create(:book)
    second_book = FactoryGirl.create(:book)

    visit books_path

    expect(page).to have_content(first_book.title, second_book.title)

  end

end
