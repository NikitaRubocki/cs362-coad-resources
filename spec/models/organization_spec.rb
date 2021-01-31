require 'rails_helper'

RSpec.describe Organization, type: :model do

    describe 'attributes' do
        it { is_expected.to respond_to(:name) }
        it { is_expected.to respond_to(:status) }
        it { is_expected.to respond_to(:phone) }
        it { is_expected.to respond_to(:email) }
        it { is_expected.to respond_to(:description) }
        it { is_expected.to respond_to(:rejection_reason) }
        it { is_expected.to respond_to(:liability_insurance) }
        it { is_expected.to respond_to(:primary_name) }
        it { is_expected.to respond_to(:secondary_name) }
        it { is_expected.to respond_to(:secondary_phone) }
        it { is_expected.to respond_to(:title) }
        it { is_expected.to respond_to(:transportation) }
        it { is_expected.to respond_to(:agreement_one) }
        it { is_expected.to respond_to(:agreement_two) }
        it { is_expected.to respond_to(:agreement_three) }
        it { is_expected.to respond_to(:agreement_four) }
        it { is_expected.to respond_to(:agreement_five) }
        it { is_expected.to respond_to(:agreement_six) }
        it { is_expected.to respond_to(:agreement_seven) }
        it { is_expected.to respond_to(:agreement_eight) }
    end

    describe 'associations' do
        it { is_expected.to have_many(:users) }
        it { is_expected.to have_many(:tickets) }
        it { is_expected.to have_and_belong_to_many(:resource_categories) }
    end

    describe 'validations' do
        it { should validate_presence_of(:email) }
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:phone) }
        it { should validate_presence_of(:status) }
        it { should validate_presence_of(:primary_name) }
        it { should validate_presence_of(:secondary_name) }
        it { should validate_presence_of(:secondary_phone) }
        it { should validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create) }
        it { should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
        it { should validate_length_of(:description).is_at_most(1020).on(:create) }
        it { should validate_uniqueness_of(:email).case_insensitive}
        it { should validate_uniqueness_of(:name).case_insensitive}
        # email regex?
    end

end
