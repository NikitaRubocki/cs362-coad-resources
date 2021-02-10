require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'attributes' do
    it { is_expected.to respond_to(:email) }
    it { is_expected.to respond_to(:role) }
    it { is_expected.to respond_to(:organization) }
  end

  it 'belongs to organization' do
    expect(subject).to belong_to(:organization).optional
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password).on(:create) }
    it { should validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create) }
    it { should validate_length_of(:password).is_at_least(7).is_at_most(255).on(:create) }
    it { should validate_uniqueness_of(:email).case_insensitive}
    let (:bad_user) { build_stubbed(:user, :bad_email) }
    specify { expect(bad_user).to_not be_valid() }
  end

  describe '#' do
    let (:user) { create(:user, email: 'fake@test.com')}

    it 'is sets a default role of organization' do
      user.set_default_role
      expect(user.role).to eq('organization')
    end

    it 'it has a string representation that is its name' do
      expect(user.to_s).to eq('fake@test.com')
    end
  end

end
