FactoryBot.define do

  factory :organization do
    sequence(:name) { |i| "Fake Organization #{i}" }
    email { Faker::Internet.email }
    phone { '541-398-3298' }
    description { 'Lorem ipsum' }
    primary_name { 'Primary Name' }
    secondary_name { 'Secondary Name' }
    secondary_phone { '555-555-5555' }

    trait 'bad_email' do
      email { 'bad email' }
    end

    trait 'approved' do
      status { :approved }
    end

    trait 'submitted' do
      status { :submitted }
    end

    trait 'rejected' do
      status { :rejected }
    end
  end

end