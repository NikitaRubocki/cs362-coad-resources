require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

    it 'exists' do
        ResourceCategory.new
    end

    it 'has a name' do
        resource_cat = ResourceCategory.new
        expect(resource_cat).to respond_to(:name)
    end

    it 'can be active' do
        resource_cat = ResourceCategory.new
        expect(resource_cat).to respond_to(:active)
    end

end
