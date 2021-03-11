require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

	context 'organization user' do
		before do
			org_user = build(:user, :org_role)
			allow(request.env['warden']).to receive(:authenticate!).and_return(org_user)
			allow(controller).to receive(:current_user).and_return(build(:user, :org_role))
		end
		
		it 'redirects to dashboard' do
			delete :destroy, params: {id: 'fake'}
			expect(response).to redirect_to(dashboard_url)
		end
	end

end
