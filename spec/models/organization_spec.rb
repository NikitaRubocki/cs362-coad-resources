require 'rails_helper'

RSpec.describe Organization, type: :model do

    let (:org) { Organization.new }

    it 'exists' do
        Organization.new
    end

    it 'has a name' do
        expect(org).to respond_to(:name)
    end

    it 'has a status' do
        expect(org).to respond_to(:status)
    end

    it 'has a phone' do
        expect(org).to respond_to(:phone)
    end

    it 'has an email' do
        expect(org).to respond_to(:email)
    end

    it 'has a description' do
        expect(org).to respond_to(:description)
    end

    it 'has a rejection_reason' do
        expect(org).to respond_to(:rejection_reason)
    end

    it 'has liability_insurance' do
        expect(org).to respond_to(:liability_insurance)
    end

    it 'has a primary_name' do
        expect(org).to respond_to(:primary_name)
    end


    it 'has a secondary_name' do
        expect(org).to respond_to(:secondary_name)
    end


    it 'has a secondary_phone' do
        expect(org).to respond_to(:secondary_phone)
    end

    it 'has a title' do
        expect(org).to respond_to(:title)
    end

    it 'has transportation' do
        expect(org).to respond_to(:transportation)
    end


end
