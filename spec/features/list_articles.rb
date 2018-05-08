require 'rails_helper'

RSpec.feature 'List articles' do
  before do
    @article1 = Article.create(title: 'The first title', body: 'The first body')
    @article2 = Article.create(title: 'The second title', body: 'The second body')
  end

  scenario 'User view a list of articles' do
    visit '/'

    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article2.title)

    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
  end
end
