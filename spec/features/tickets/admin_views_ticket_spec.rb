require 'rails_helper'

RSpec.describe 'Viewing a ticket', type: :feature do

	let(:admin) { create(:user, :admin_role) }

	it 'shows ticket details' do
		ticket = create(:ticket)
		log_in_as(admin)
		visit dashboard_path
		click_on ticket.name
		expect(page.body).to have_selector("h1", text: "Ticket #{ticket.id}")
	end

end