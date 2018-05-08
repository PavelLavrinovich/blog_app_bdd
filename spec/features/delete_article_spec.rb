require 'rails_helper'

RSpec.feature 'Delete article' do
  before do
    @article = Article.create(title: 'Test title', body: 'Test body')
  end

  scenario 'User delete an article' do
    visit '/'

    click_link @article.title
    click_link 'Delete'

    expect(page).to have_content('Article has been deleted')
    expect(current_path).to eq(articles_path)
    expect(page).to_not have_content('Test title')
  end
end