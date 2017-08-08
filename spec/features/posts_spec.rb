require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario 'user creates a post' do
    visit root_path

    expect {
      fill_in "What's on your mind?", with: 'Rails'
      click_on 'Post'
    }.to change(Post.all, :count).by(1)

    expect(page).to have_content('Rails')
  end
end
