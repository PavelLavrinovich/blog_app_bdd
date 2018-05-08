require 'rails_helper'

RSpec.feature 'Show article' do
  before do
    @article = Article.create(title: 'Test title', body: 'Test body')
  end

  scenario 'User view an article' do
    visit '/'

    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq article_path(@article)

    expect(page).to have_link('Back to the list')
    expect(page).to have_link('Edit')
    expect(page).to have_link('Delete')
  end
end