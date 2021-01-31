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
        # it { should belong_to(:organization).optional }
    end

end
