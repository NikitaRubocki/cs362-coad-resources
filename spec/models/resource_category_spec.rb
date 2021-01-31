require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

    describe 'attributes' do
        it { is_expected.to respond_to(:name) }
        it { is_expected.to respond_to(:active) }
    end

    describe 'associations' do
        it { is_expected.to have_many(:tickets) }
        it { is_expected.to have_and_belong_to_many(:organizations) }
    end

    describe 'validations' do
        it { should validate_presence_of(:name) }
        it { should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
        it { should validate_uniqueness_of(:name).case_insensitive}
    end

end
