require 'rails_helper'

RSpec.feature "Registrations", type: :feature do
  scenario 'user can register with valid information' do
    visit root_path

    expect {
      within('.signup') do
        fill_in 'First name', with: 'John'
        fill_in 'Last name', with: 'Doe'
        fill_in 'Email', with: 'john@example.org'
        fill_in 'Password', with: 'foobar'
        click_on 'Sign up'
      end
    }.to change(User.all, :count).by(1)

    within('header') do
      expect(page).to have_content('John')
    end
  end

  scenario 'user cannot register with invalid information' do
    visit root_path

    expect {
      within('.signup') do
        fill_in 'First name', with: 'J'
        fill_in 'Last name', with: 'j' * 31
        fill_in 'Email', with: 'invalid@email'
        fill_in 'Password', with: 'short'
        click_on 'Sign up'
      end
    }.to_not change(User.all, :count)

    expect(page).to have_css('.alert-danger')
    expect(page).to have_content('The form contains')
    expect(page).to have_content('Email is invalid')
    expect(page).to have_content('First name is too short')
    expect(page).to have_content('Last name is too long')
    expect(page).to have_content('Password is too short')
  end

  scenario 'user can sign in with right email/password combo' do
    create(:user, email: 'john@example.org')
    visit root_path

    within('.login') do
      fill_in 'Email', with: 'john@example.org'
      fill_in 'Password', with: 'foobar'
      click_on 'Log in'
    end

    expect(page).to have_content('John')
    expect(page).to_not have_content('Log in')
  end

  scenario 'user cannot sign in with wrong email/password combo' do
    visit root_path

    within('.login') do
      fill_in 'Email', with: 'non_existent@example.org'
      fill_in 'Password', with: 'foobar'
      click_on 'Log in'
    end

    expect(page).to have_content('Bad email or password')
    expect(page).to have_content('Log in')
  end
end
