require 'rails_helper'

RSpec.describe Ticket, type: :model do

    describe 'attributes' do
        it { is_expected.to respond_to(:name) }
        it { is_expected.to respond_to(:description) }
        it { is_expected.to respond_to(:phone) }
        it { is_expected.to respond_to(:closed) }
        it { is_expected.to respond_to(:organization) }
        it { is_expected.to respond_to(:resource_category) }
        it { is_expected.to respond_to(:region) }
        it { is_expected.to respond_to(:description) }
        it { is_expected.to respond_to(:description) }
    end

    describe 'associations' do
        it { should belong_to(:region) }
        it { should belong_to(:resource_category) }
        it { should belong_to(:organization).optional }
    end

    describe 'validations' do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:phone) }
        it { should validate_presence_of(:region_id) }
        it { should validate_presence_of(:resource_category_id) }
        it { should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
        it { should validate_length_of(:description).is_at_most(1020).on(:create) }
        # it { should validate(:phone).phony_plausible}
    end

end
