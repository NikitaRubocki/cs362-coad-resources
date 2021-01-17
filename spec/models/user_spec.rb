require 'rails_helper'

RSpec.describe User, type: :model do

    it 'exists' do
        User.new
    end

    it 'has an email' do
        user = User.new
        expect(user).to respond_to(:email)
    end

    it 'has an encrypted password' do
        user = User.new
        expect(user).to respond_to(:encrypted_password)
    end

    it 'has a reset password token' do
        user = User.new
        expect(user).to respond_to(:reset_password_token)
    end

end
