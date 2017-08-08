require 'rails_helper'

RSpec.feature "Registrations", type: :feature do
  scenario 'user can register' do
    visit root_path
  end
end
