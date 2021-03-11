require 'rails_helper'

RSpec.describe 'Viewing Regions', type: :feature do

	let(:admin) { create(:user, :admin_role) }

  it 'shows a list of region names' do
		region = create(:region)
		log_in_as(admin)
		click_on 'Regions'
		expect(page.body).to have_text(region.name)
	end

	it 'shows the details of one region' do
		region = create(:region)
		ticket = create(:ticket, region: region)
		log_in_as(admin)
		visit region_path(region)
		expect(page.body).to have_text(region.name)
		expect(page.body).to have_text(ticket.name)
	end

end
