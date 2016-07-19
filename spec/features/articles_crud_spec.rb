require 'spec_helper'

feature 'CRUD for articles' do

  scenario 'Creating a new Article + Tags' do
    visit articles_path
    click_link 'New Article'

    expect(page).to have_content 'New Article'

    fill_in 'Title', :with => 'Test Article 1'
    fill_in 'Body', :with => 'Some awesome content'
    fill_in 'article_all_tags', :with => 'tag1, tag2'
    click_button 'Create Article'

    expect(page).to have_content 'Test Article 1'

  end

  context 'Having a certain article:' do

    background do
      @article = Article.create(:title => 'Awesome Blog Article', :body => 'Some awesome content')
    end

    scenario 'Editing the article' do
      visit article_path(@article)

      click_link 'Edit'

      fill_in 'Title', :with => 'Some more awesome content'
      click_button 'Update Article'

      expect(page).to have_content 'Some more awesome content'
    end
  end
end
