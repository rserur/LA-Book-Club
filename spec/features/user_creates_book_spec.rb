require 'rails_helper'

feature 'user creates book' do

  scenario '.book successfully added with new author' do

    category = FactoryGirl.create(:category)

    book_attrs = {
      title: Faker::Address.city,
      description: Faker::Lorem.sentence,
      year: rand(1000..2014)
    }

    author_attrs = {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
    }

    book = Book.new(book_attrs)
    author = Author.new(author_attrs)

    visit new_book_path

    fill_in 'Title', with: book.title
    fill_in 'Description', with: book.description
    fill_in 'Year', with: book.year
    select category.name, from: 'book[category_id]'

    fill_in 'First name', with: author.first_name
    fill_in 'Last name', with: author.last_name

    click_button 'Create Book'

    expect(page).to have_content 'Book successfully created with new author.'

  end

  scenario '.book successfully added with existing author' do

    category = FactoryGirl.create(:category)

    author = FactoryGirl.create(:author)

    book_attrs = {
      title: Faker::Address.city,
      description: Faker::Lorem.sentence,
      year: rand(1000..2014)
    }

    book = Book.new(book_attrs)

    visit new_book_path

    fill_in 'Title', with: book.title
    fill_in 'Description', with: book.description
    fill_in 'Year', with: book.year
    select category.name, from: 'book[category_id]'

    fill_in 'First name', with: author.first_name
    fill_in 'Last name', with: author.last_name

    click_button 'Create Book'

    expect(page).to have_content 'Book successfully created with existing author.'

  end

  scenario '.book creation fails due to missing fields' do

    visit new_book_path

    click_button 'Create Book'

    expect(page).to have_content "can't be blank"

  end

  scenario '.book creation fails when year is incorrect' do

    book_attrs = {
      title: Faker::Address.city,
      description: Faker::Lorem.sentence,
      year: 123
    }

    book = Book.new(book_attrs)

    visit new_book_path

    fill_in 'Title', with: book.title
    fill_in 'Description', with: book.description
    fill_in 'Year', with: book.year

    click_button 'Create Book'

    expect(page).to have_content "is the wrong length"

  end


end
