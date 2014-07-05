require 'rails_helper'

feature 'user views reviews on book show page' do

  scenario '.all reviews are displayed' do

    review1 = FactoryGirl.create(:review)
    review2 = FactoryGirl.create(:review, book_id: review1.book_id)

    visit book_path(review1.book_id)

    expect(page).to have_content(review1.rating, review2.rating)
    expect(page).to have_content(review1.body, review2.body)

  end

end
