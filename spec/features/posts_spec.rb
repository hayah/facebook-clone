require 'rails_helper'

RSpec.feature "Posts", type: :feature, js: true do
  scenario 'user can create, edit, and delete a post' do
    user = create(:user)
    visit root_path(as: user)

    expect {
      fill_in "What's on your mind?", with: 'Rails'
      click_on 'Post'
    }.to change(Post.all, :count).by(1)

    expect(page).to have_content('Rails')

    click_on 'Edit'
    fill_in "post_content", with: 'PHP'
    click_on 'Save'

    expect(page).to have_content('PHP')

    expect {
      accept_alert do
        click_on 'Delete'
      end
    }.to change(Post.all, :count).by(-1)

    expect(page).to_not have_content('PHP')
  end
end
