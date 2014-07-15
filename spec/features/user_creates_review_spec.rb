require 'rails_helper'

feature 'user creates review' do

  scenario '.review successfully added' do

    book = FactoryGirl.create(:book)

    visit book_path(book.id)

    review_attrs = { rating: rand(1..5), body: Faker::Lorem.sentence }

    review = Review.new(review_attrs)

    select review.rating, from: 'review[rating]'
    fill_in 'Body', with: review.body

    click_button 'Create Review'

    expect(page).to have_content 'Review successfully created.'

  end

  scenario '.creating review fails without rating' do

    book = FactoryGirl.create(:book)

    visit book_path(book.id)

    fill_in 'Body', with: Faker::Lorem.sentence

    click_button 'Create Review'

    expect(page).to have_content "can't be blank"

  end

  scenario '.creating review fails without body' do

    book = FactoryGirl.create(:book)

    visit book_path(book.id)

    select rand(1..5), from: 'review[rating]'

    click_button 'Create Review'

    expect(page).to have_content "can't be blank"

  end

end
