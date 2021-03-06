require 'spec_helper'

feature 'CRUD for posts' do

  scenario 'Creating a new Post + Tags' do
    visit root_path
    click_link 'New Post'

    expect(page).to have_content 'New Post'

    fill_in 'Title', :with => 'Test Post 1'
    fill_in 'Body', :with => 'Some awesome content'
    fill_in 'post_all_tags', :with => 'tag1, tag2'
    click_button 'Create Post'

    expect(page).to have_content 'Test Post 1'

  end

  context 'Having a certain post:' do
    
    background do
      @post = Post.create(:title => 'Awesome Blog Post', :body => 'Some awesome content')
    end

    scenario 'Editing the post' do
      visit post_path(@post)

      click_link 'Edit'

      fill_in 'Title', :with => 'Some more awesome content'
      click_button 'Update Post'

      expect(page).to have_content 'Some more awesome content'
    end
  end
end
