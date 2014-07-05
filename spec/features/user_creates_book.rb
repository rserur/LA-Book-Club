require 'rails_helper'

feature 'user creates book' do

  scenario '.book successfully added with new author' do

    category = FactoryGirl.create(:category)

    book_attrs = {
      title: Faker::Address.city,
      description: Faker::Lorem.sentence,
      year: rand(2014)
    }

    author_attrs = {
      author_first: Faker::Name.first_name,
      author_last: Faker::Name.last_name
    }

    book = Book.new(book_attrs)
    author = Author.new(author_attrs)

    visit new_book_path

    fill_in 'Title', with: book.title
    fill_in 'Description', with: book.description
    fill_in 'Year', with: book.year
    select category.name, from: 'Category'

    fill_in 'First Name', with: author.first_name
    fill_in 'Last Name', with: author.last_name

    click_button 'Create Book'

    expect(page).to have_content 'Book was successfully created.'
    expect(page).to have_content 'Author was successfully created.'

  end

  scenario '.book successfully added with existing author' do

    category = FactoryGirl.create(:category)

    author = FactoryGirl.create(:author)

    book_attrs = {
      title: Faker::Address.city,
      description: Faker::Lorem.sentence,
      year: rand(2014)
    }

    book = Book.new(book_attrs)

    visit new_book_path

    fill_in 'Title', with: book.title
    fill_in 'Description', with: book.description
    fill_in 'Year', with: book.year
    select category.name, from: 'Category'

    fill_in 'First Name', with: author.first_name
    fill_in 'Last Name', with: author.last_name

    click_button 'Create Book'

    expect(page).to have_content 'Book was successfully created.'
    expect(page).to have_content 'Existing author selected for book.'

  end

  scenario '.book creation fails due to missing fields' do

    visit new_book_path

    click_button 'Create Book'

    expect(page).to have_content "Title can't be blank."
    expect(page).to have_content "Year can't be blank."
    expect(page).to have_content "First Name can't be blank."
    expect(page).to have_content "Last Name can't be blank."
  end


end
