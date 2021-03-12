require 'rails_helper'

RSpec.describe 'User registration', type: :feature do

	it 'registers a user' do
		visit root_path
		click_on 'Sign up'
		fill_in 'Email address', with: 'fake@fake.com'
		fill_in 'Password', with: 'verysecurepassword'
		fill_in 'Password confirmation', with: 'verysecurepassword'
		within 'form#new_user' do
			click_on 'Sign up' 
		end
		expect(page.body).to have_text('successfully')
	end

end
