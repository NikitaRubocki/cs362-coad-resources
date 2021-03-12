require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do

	it 'logs a user into the system' do
		user = create(:user)
		visit root_path
		click_on 'Log in'
		fill_in 'Email address', with: user.email
		fill_in 'Password', with: user.password
		click_on 'Sign in'
		expect(page.body).to have_text('successfully')
		expect(page.body).to have_text('Dashboard')
	end

end
