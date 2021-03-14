require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do

  let(:admin) { create(:user, :admin_role) }

  it 'approves an organization' do
    org = create(:organization, :submitted)
    log_in_as(admin)
		click_on 'Organizations'
    click_on org.name
    click_on 'Approve'
    expect(page.body).to have_text('approved')
  end

end
