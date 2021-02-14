FactoryBot.define do

  sequence :ticket_name do |n|
    "Fake Ticket #{n}"
  end

  factory :ticket do
    name { generate(:ticket_name) }
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