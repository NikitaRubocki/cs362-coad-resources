require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do

  let(:admin) { create(:user, :admin_role) }

  it 'deletes a resource category' do
		category = create(:resource_category)
		log_in_as(admin)
		visit resource_category_path(category)
		click_on 'Delete'
		expect(page.body).to have_text('Unspecified')
		expect(page.body).to have_text('deleted')
	end

end
