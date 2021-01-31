require 'rails_helper'

RSpec.describe User, type: :model do

    let (:user) { User.new() }

    it 'exists' do
        User.new
    end

    it 'has an email' do
        expect(user).to respond_to(:email)
    end

    it 'has a role' do
        expect(user).to respond_to(:role)
    end

    it 'has an organization' do
        expect(user).to respond_to(:organization)
    end

end
