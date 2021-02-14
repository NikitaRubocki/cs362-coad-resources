FactoryBot.define do

  factory :ticket do
    sequence(:name) { |i| "Fake Ticket #{i}" }
    phone { '+15414541232' }
    description { 'Lorem ipsum' }
    organization
    resource_category
    region

    trait 'open' do
      closed { false }
    end

    trait 'closed' do
      closed { true }
    end

    trait "nil_org" do 
      organization { nil }
    end

    trait 'bad_phone' do
      phone { 'bad phone' } 
    end
  end

end