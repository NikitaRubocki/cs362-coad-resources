require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do
  
	let(:admin) { create(:user, :admin_role) }

  it 'deletes a ticket' do
		ticket = create(:ticket)
		log_in_as(admin)
		click_on ticket.name
		click_on 'Delete'
		expect(page.body).to have_text('deleted')
	end

end
