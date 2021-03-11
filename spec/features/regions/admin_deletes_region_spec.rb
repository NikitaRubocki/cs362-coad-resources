require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do

	let(:admin) { create(:user, :admin_role) }

	it 'deletes a region' do
		region = create(:region)
		log_in_as(admin)
		visit region_path(region)
		click_on 'Delete'
		expect(page.body).to have_text('Unspecified')
		expect(page.body).to have_text('deleted')
	end

end
