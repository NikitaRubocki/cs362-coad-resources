require 'rails_helper'

RSpec.describe 'Creating a Resource Category', type: :feature do

	let(:admin) { create(:user, :admin_role) }

  it 'creates a resource category' do
		resource_name = 'Fake Resource Category'
		log_in_as(admin)
		click_on 'Categories'
		click_on 'Add Resource Category'
		fill_in 'Name', with: resource_name
		click_on 'Add resource category'
		expect(page.body).to have_text('Category successfully created')
		expect(page.body).to have_text(resource_name)
	end

	it 'does not create a resource category when name field is blank' do
		log_in_as(admin)
		click_on 'Categories'
		click_on 'Add Resource Category'
		click_on 'Add resource category'
		expect(page.body).to have_text('errors')
	end

end