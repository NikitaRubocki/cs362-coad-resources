require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

	context 'unauthenticated user' do
		it 'redirects to sign_in screen' do
			get :index
			expect(response).to redirect_to(new_user_session_url)
			get :show, params: {id: 'fake'}
			expect(response).to redirect_to(new_user_session_url)
			get :new
			expect(response).to redirect_to(new_user_session_url)
			post :create
			expect(response).to redirect_to(new_user_session_url)
			get :edit, params: {id: 'fake'}
			expect(response).to redirect_to(new_user_session_url)
			put :update, params: {id: 'fake'}
			expect(response).to redirect_to(new_user_session_url)
			delete :destroy, params: {id: 'fake'}
			expect(response).to redirect_to(new_user_session_url)
		end
	end

	context 'organization user' do
		before do
			org_user = build(:user, :org_role)
			allow(request.env['warden']).to receive(:authenticate!).and_return(org_user)
			allow(controller).to receive(:current_user).and_return(build(:user, :org_role))
		end
		
		it 'redirects to dashboard' do
			get :index
			expect(response).to redirect_to(dashboard_url)
			get :show, params: {id: 'fake'}
			expect(response).to redirect_to(dashboard_url)
			get :new
			expect(response).to redirect_to(dashboard_url)
			post :create
			expect(response).to redirect_to(dashboard_url)
			get :edit, params: {id: 'fake'}
			expect(response).to redirect_to(dashboard_url)
			put :update, params: {id: 'fake'}
			expect(response).to redirect_to(dashboard_url)
			delete :destroy, params: {id: 'fake'}
			expect(response).to redirect_to(dashboard_url)
		end
	end

end
