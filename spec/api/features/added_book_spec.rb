require 'features_helper'

describe 'Added book' do
  after do
    BookRepository.new.clear
  end

  it 'can create new book' do
    visit 'books/new'

    within 'form#book-form' do
      fill_in 'Title', with: 'New book'
      fill_in 'Author', with: 'Some author'

      click_button 'Create'
    end

    expect(current_path).to eq('/books')
    expect(page).to have_content('New book')
  end

end