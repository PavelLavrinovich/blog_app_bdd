require 'rails_helper'

RSpec.feature 'Edit article' do
  before do
    @article = Article.create(title: 'Test title', body: 'Test body')
  end

  scenario 'User edit an article' do
    visit '/'

    click_link @article.title
    click_link 'Edit'

    fill_in 'Title', with: 'New title'
    fill_in 'Body', with: 'New body'
    click_button 'Update Article'

    expect(page).to have_content 'Article has been updated'
    expect(page).to have_content 'New title'
    expect(page).to have_content 'New body'
    expect(current_path).to eq(article_path(@article))
  end

  scenario 'User edit an article with wrong values' do
    visit '/'

    click_link @article.title
    click_link 'Edit'

    fill_in 'Title', with: ''
    fill_in 'Body', with: ''
    click_button 'Update Article'

    expect(page).to have_content 'Article has not been updated'
    expect(page).to have_content 'Title can\'t be blank'
    expect(page).to have_content 'Body can\'t be blank'
  end
end