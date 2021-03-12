require 'rails_helper'

RSpec.describe 'Releasing a ticket by an', type: :feature do

	let(:admin) { create(:user, :admin_role) }
	let(:org) { create(:organization, :approved) }
	let(:user) { create(:user, :org_role, organization: org) }
	
	describe 'admin_user' do
		it 'releases a ticket' do
			ticket = create(:ticket, :valid_org)
			log_in_as(admin)
			click_on ticket.name
			click_on 'Release'
			click_on ticket.name
			expect(page.body).to have_selector('dd', text: '')
		end
	end

	describe 'user with approved organization' do
		it 'releases a ticket' do
			ticket = create(:ticket, organization: org)
			log_in_as(user)
			click_on 'Tickets'
			click_on ticket.name
			click_on 'Release'
			click_on ticket.name
			expect(page.body).to have_selector('dd.col-9', text: '')
		end
	end

end
