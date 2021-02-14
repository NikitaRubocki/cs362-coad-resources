FactoryBot.define do

  sequence :org_name do |n|
    "Fake Organization #{n}"
  end

  factory :organization do
    name { generate(:org_name) }
    email { Faker::Internet.email }
    phone { '541-398-3298' }
    status { 1 }
    description { 'Lorem ipsum' }
    primary_name { 'Primary Name' }
    secondary_name { 'Secondary Name' }
    secondary_phone { '555-555-5555' }

    trait 'bad_email' do
      email { 'bad email' }
    end
  end

end