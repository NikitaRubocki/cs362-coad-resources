require 'rails_helper'

RSpec.describe 'Rejecting an organization', type: :feature do

  let(:admin) { create(:user, :admin_role) }

  it 'rejects an organization' do
    org = create(:organization, :submitted)
    log_in_as(admin)
		click_on 'Organizations'
    click_on org.name
    click_on 'Reject'
    expect(page.body).to have_text('rejected')
  end

end
