require 'spec_helper'

feature 'Posts Page:' do
  background do
    @post = Post.create(:title => 'Test Post 1', :body => 'Some awesome content')
    Post.create(:title => 'Test Post 2', :body => 'Sum more awesome content')
    Post.create(:title => 'Test Post 3', :body => 'Final awesome content')
  end

  scenario 'Contains created posts' do
    visit root_path

    expect(page).to have_content 'Test Post 1'
    expect(page).to have_content 'Test Post 2'
        expect(page).to have_content 'Test Post 3'
  end

  scenario 'Links to created post correctly' do
    visit root_path
    click_link 'Test Post 1'

    expect(current_path).to eq post_path(@post)
  end
end
