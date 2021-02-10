require 'rails_helper'

RSpec.describe Region, type: :model do

  let (:region) { create(:region) }

  it 'has a name' do
    expect(region).to respond_to(:name)
  end

  it 'has many tickets' do
    expect(region).to have_many(:tickets)
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
    it { should validate_uniqueness_of(:name).case_insensitive}
  end

  describe '#' do
    it 'returns a ResourceCategory with the name Unspecified' do
      expect(ResourceCategory.unspecified.name).to eq('Unspecified')
    end
  
    it 'it has a string representation that is its name' do
      expect(Region.new(name: 'Fake').to_s).to eq('Fake')
    end
  end  

end
