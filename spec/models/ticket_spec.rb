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
    let (:bad_phone_ticket) { build_stubbed(:ticket, :bad_phone) }
    specify { expect(bad_phone_ticket).to_not be_valid() }
  end

  describe 'scope' do
    let (:open_ticket_nil_org) { create(:ticket, :open, :nil_org)}
    let (:open_ticket) { create(:ticket, :open, :valid_org)}
    let (:closed_ticket) { create(:ticket, :closed, :valid_org)}

    describe 'open' do
      it 'includes open tickets and does not include closed tickets' do
        results = Ticket.open
        expect(results).to include(open_ticket_nil_org)
        expect(results).to_not include(closed_ticket)
      end
    end

    describe 'closed' do
      it 'includes closed tickets and does not include open tickets' do
        results = Ticket.closed
        expect(results).to include(closed_ticket)
        expect(results).to_not include(open_ticket_nil_org)
      end
    end

    describe 'all_organization' do
      it 'includes all organizations where closed is false' do
        results = Ticket.all_organization
        expect(results).to include(open_ticket)
      end
    end

    describe 'organization' do
      let (:organization) { create(:organization) }
      let (:org_ticket) { create(:ticket, organization: organization) }
      it 'includes tickets at organization id where closed is false' do
        results = Ticket.organization(organization.id)
        expect(results).to include(org_ticket)
        expect(results).to_not include(open_ticket)
        expect(results).to_not include(closed_ticket)
      end
    end

    describe 'closed_organization' do
      let (:organization) { create(:organization) }
      let (:org_ticket) { create(:ticket, :closed, organization: organization) }
      it 'includes tickets at organization id where closed is false' do
        results = Ticket.closed_organization(organization.id)
        expect(results).to include(org_ticket)
        expect(results).to_not include(open_ticket)
        expect(results).to_not include(closed_ticket)
      end
    end

    describe 'region' do
      let (:region) { create(:region) }
      let (:region_ticket) { create(:ticket, region: region) }
      it 'includes all tickets with region id' do
        results = Ticket.region(region.id)
        expect(results).to include(region_ticket)
        expect(results).to_not include(open_ticket)
        expect(results).to_not include(closed_ticket)
      end
    end

    describe 'resource_category' do
      let (:resource_category) { create(:resource_category) }
      let (:rc_ticket) { create(:ticket, resource_category: resource_category) }
      it 'includes all tickets with region id' do
        results = Ticket.region(resource_category.id)
        expect(results).to include(rc_ticket)
        expect(results).to_not include(open_ticket)
        expect(results).to_not include(closed_ticket)
      end
    end
  end

  describe '#' do
    let (:ticket) { create(:ticket, :open, :valid_org) }

    it 'is open when its closed attribute is false' do
      expect(ticket.open?).to be_truthy
      ticket.closed = true
      expect(ticket.open?).to be_falsy
    end

    it 'is captured if there is an associated organization' do
      expect(ticket.captured?).to be_truthy
    end

    it 'has a string representation that is its id' do
      expect(Ticket.new(id: 1).to_s).to eq('Ticket 1')
    end
  end
end
