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
    # You mentioned that we can test generally, like a user should be 
    # part of an organization.  Do we then have to bring in the organization
    # module and add a User to it?
    # it 'has an organization_id' do
    #     expect(ticket).to respond_to(:organization_id)
    # end

    # it 'has a resource category' do
    #     expect(ticket).to respond_to(:resource_category_id)
    # end

    # it 'has a region_id' do
    #     expect(ticket).to respond_to(:region_id)
    # end

end
