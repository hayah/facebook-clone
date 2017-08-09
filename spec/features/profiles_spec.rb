require 'rails_helper'

RSpec.feature "Profiles", type: :feature do
  scenario 'user can view and edit his own profile' do
    user = create(:user)

    visit root_path(as: user)
    expect(page).to have_content 'John Doe'

    click_on 'Edit profile'
    fill_in 'First name', with: 'Jane'
    fill_in 'Last name', with: 'Dow'
    fill_in 'Phone number', with: '1234567'
    fill_in 'Birth date', with: '01/01/1989'
    fill_in 'City', with: 'Moscow'
    fill_in 'Bio', with: 'Rails developer'
    click_on 'Save changes'

    expect(page).to have_content('Jane Dow')
    expect(page).to have_content('1 January 1989')
    expect(page).to have_content('1234567')
    expect(page).to have_content('Moscow')
    expect(page).to have_content('Rails developer')
  end
end
