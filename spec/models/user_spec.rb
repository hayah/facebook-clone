require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    create(:user)
    user = build(:user)
    expect(user).to be_valid
  end

  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_length_of(:first_name).
       is_at_least(2).is_at_most(30) }
  it { is_expected.to validate_presence_of :last_name }
  it { is_expected.to validate_length_of(:last_name).
       is_at_least(2).is_at_most(30) }
  it { is_expected.to validate_presence_of :password }
  it { is_expected.to validate_length_of(:password).
       is_at_least(6).is_at_most(64) }
  it { is_expected.to validate_presence_of :email }
end
