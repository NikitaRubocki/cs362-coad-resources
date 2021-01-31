require 'rails_helper'

RSpec.describe User, type: :model do

    describe 'attributes' do
        it { is_expected.to respond_to(:email) }
        it { is_expected.to respond_to(:role) }
        it { is_expected.to respond_to(:organization) }
    end

    # it "belongs to organization" do
    #     expect(subject).to belong_to(:organization).optional
    # end

end
