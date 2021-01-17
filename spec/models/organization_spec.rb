require 'rails_helper'

RSpec.describe Organization, type: :model do

    it 'exists' do
        Organization.new
    end

    it 'has a name' do
        org = Organization.new
        expect(org).to respond_to(:name)
    end

    it 'has a status' do
        org = Organization.new
        expect(org).to respond_to(:status)
    end

    it 'has a phone' do
        org = Organization.new
        expect(org).to respond_to(:phone)
    end

    it 'has an email' do
        org = Organization.new
        expect(org).to respond_to(:email)
    end

    it 'has a description' do
        org = Organization.new
        expect(org).to respond_to(:description)
    end

    it 'has a rejection reason' do
        org = Organization.new
        expect(org).to respond_to(:rejection_reason)
    end

    it 'has liability insurance' do
        org = Organization.new
        expect(org).to respond_to(:liability_insurance)
    end

    it 'has a primary name' do
        org = Organization.new
        expect(org).to respond_to(:primary_name)
    end


    it 'has a secondary name' do
        org = Organization.new
        expect(org).to respond_to(:secondary_name)
    end


    it 'has a secondary phone' do
        org = Organization.new
        expect(org).to respond_to(:secondary_phone)
    end

    it 'has a title' do
        org = Organization.new
        expect(org).to respond_to(:title)
    end

    it 'has transportation' do
        org = Organization.new
        expect(org).to respond_to(:transportation)
    end


end
