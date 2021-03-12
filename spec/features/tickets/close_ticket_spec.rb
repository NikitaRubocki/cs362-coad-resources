require 'rails_helper'

RSpec.describe 'Closing a ticket', type: :feature do

	let(:admin) { create(:user, :admin_role) }
	let(:org) { create(:organization, :approved) }
	let(:user) { create(:user, :org_role, organization: org) }
	
	describe 'admin_user' do
		it 'closes a ticket' do
			ticket = create(:ticket)
			log_in_as(admin)
			click_on ticket.name
			click_on 'Close'
			click_on ticket.name
			expect(page.body).to have_selector('dd', text: 'Closed')
		end
	end

	describe 'user with approved organization' do
		it 'closes a ticket' do
			ticket = create(:ticket)
			log_in_as(user)
			click_on 'Tickets'
			click_on ticket.name
			click_on 'Capture'
			click_on 'Tickets'
			click_on ticket.name
			click_on 'Close'
			click_on ticket.name
			expect(page.body).to have_selector('dd', text: 'Closed')
		end
	end

end
