require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do

	it 'creates a ticket' do
		region = create(:region)
		category = create(:resource_category)
		visit root_path
		click_on 'Get Help'
		fill_in 'Full Name', with: 'Fake Person'
		fill_in 'Phone Number', with: '5414567890'
		select region.name, from: 'Region'
		select category.name, from: 'Resource Category'
		fill_in 'Description', with: 'Lorem ipsom'
		click_on 'Send this help request'
		expect(page.body).to have_text('Submitted')
	end

end
