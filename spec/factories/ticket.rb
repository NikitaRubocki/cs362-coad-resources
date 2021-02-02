FactoryBot.define do

  factory :ticket do
    name { 'Fake Ticket' }
    phone { '+15414541232' }
    description { 'Lorem ipsum' }
    organization
    resource_category
    region

    trait "nil_org" do 
      organization { nil }
    end

    trait 'open' do
      closed { false }
    end

    trait 'closed' do
      closed { true }
    end
  end

end