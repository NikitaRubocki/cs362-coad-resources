require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

  let (:active_rc) { create(:resource_category, :active) }
  let (:inactive_rc) { create(:resource_category, :inactive) }

	describe 'attributes' do
		it { is_expected.to respond_to(:name) }
		it { is_expected.to respond_to(:active) }
	end

	describe 'associations' do
		it { is_expected.to have_many(:tickets) }
		it { is_expected.to have_and_belong_to_many(:organizations) }
	end

	describe 'validations' do
		it { should validate_presence_of(:name) }
		it { should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
		it { should validate_uniqueness_of(:name).case_insensitive}
	end

  describe 'scope' do
    describe 'active' do
      it 'includes active resource categories and does not include inactive resource categories' do
        results = ResourceCategory.active
        expect(results).to include(active_rc)
        expect(results).to_not include(inactive_rc)
      end
    end
    
    describe 'inactive' do
      it 'includes inactive resource categories and does not include active resource categories' do
        results = ResourceCategory.inactive
        expect(results).to include(inactive_rc)
        expect(results).to_not include(active_rc)
      end
    end
  end

  describe '#' do
    it 'returns a ResourceCategory with the name Unspecified' do
      expect(ResourceCategory.unspecified.name).to eq('Unspecified')
    end

    it 'is inactive when its active attribute is false' do
      expect(inactive_rc).to be_inactive
      inactive_rc.active = true
      expect(inactive_rc.inactive?).to be_falsy
    end
  
    it 'becomes active when activated' do
      expect(inactive_rc.active).to be_falsy
      inactive_rc.activate
      expect(inactive_rc.active).to be_truthy
    end
  
    it 'becomes inactive when deactivated' do
      expect(active_rc.active).to be_truthy
      active_rc.deactivate
      expect(active_rc.active).to be_falsy
    end
  
    it 'it has a string representation that is its name' do
      expect(ResourceCategory.new(name: 'Fake').to_s).to eq('Fake')
    end
  end

end
