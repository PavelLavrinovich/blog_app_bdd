require 'rails_helper'

RSpec.feature 'Create article' do
  scenario 'A user creates a new article' do
    visit '/'

    click_link 'New article'

    fill_in 'Title', with: 'Test title'
    fill_in 'Body', with: 'Test body'
    click_button 'Create Article'

    expect(page).to have_content('Article has been created')
    expect(page.current_path).to eq(articles_path)
  end

  scenario 'A user creates an article with an empty title and body' do
    visit '/'

    click_link 'New article'

    fill_in 'Title', with: ''
    fill_in 'Body', with: ''
    click_button 'Create Article'

    expect(page).to have_content('Article has not been created')
    expect(page).to have_content('Title can\'t be blank')
    expect(page).to have_content('Body can\'t be blank')
  end
end