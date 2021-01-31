require 'rails_helper'

RSpec.describe User, type: :model do

    describe 'attributes' do
        it { is_expected.to respond_to(:email) }
        it { is_expected.to respond_to(:role) }
        it { is_expected.to respond_to(:organization) }
    end

    it "belongs to organization" do
        expect(subject).to belong_to(:organization).optional
    end

    describe 'validations' do
        it { should validate_presence_of(:email) }
        it { should validate_presence_of(:password).on(:create) }
        it { should validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create) }
        it { should validate_length_of(:password).is_at_least(7).is_at_most(255).on(:create) }
        it { should validate_uniqueness_of(:email).case_insensitive}
        # email regex
    end

end
