require 'rails_helper'

RSpec.describe Ticket, type: :model do

    let (:ticket) { Ticket.new() }

    it 'exists' do
        Ticket.new
    end

    it 'has a name' do
        expect(ticket).to respond_to(:name)
    end

    it 'has a description' do
        expect(ticket).to respond_to(:description)
    end

    it 'has a phone' do
        expect(ticket).to respond_to(:phone)
    end

    it 'can be closed' do
        expect(ticket).to respond_to(:closed)
    end

    it 'has an organization' do
        expect(ticket).to respond_to(:organization)
    end

    it 'has a resource category' do
        expect(ticket).to respond_to(:resource_category)
    end

    it 'has a region' do
        expect(ticket).to respond_to(:region)
    end

end
