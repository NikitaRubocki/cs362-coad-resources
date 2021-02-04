FactoryBot.define do

  factory :organization do
    name { Faker::Company.name }
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