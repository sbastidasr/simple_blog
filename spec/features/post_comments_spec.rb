require 'spec_helper'

feature 'Comments' do
  background do
    @post = Post.create(:title => 'Test Post 1', :body => 'Some awesome content')
  end

#test the standard posting way
  scenario 'Comment a post' do
    visit post_path(@post)

    comment = 'Wow, that was some awesome content indeed!'
    username = 'awesomeuser'
    fill_in 'User', :with => comment
    fill_in 'Comment', :with => username
    click_button 'Add comment'


    expect(page).to have_content comment
    expect(page).to have_content username
  end
end
