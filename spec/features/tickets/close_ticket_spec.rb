require 'rails_helper'

RSpec.describe 'Closing a ticket', type: :feature do

	let(:admin) { create(:user, :admin_role) }

  it 'closes a ticket' do
		ticket = create(:ticket)
		log_in_as(admin)
		click_on ticket.name
		click_on 'Close'
		click_on ticket.name
		expect(page.body).to have_selector('dd', text: 'Closed')
	end

end
