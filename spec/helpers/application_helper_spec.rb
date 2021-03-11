require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

	describe '#full_title' do
		it 'returns default title' do
			default_title = 'Disaster Resource Network'
			expect(full_title).to eq(default_title)
		end

		it 'returns passed title | default title' do
			title = 'Test | Disaster Resource Network'
			expect(full_title('Test')).to eq(title)
		end
	end

end
