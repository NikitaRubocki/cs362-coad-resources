FactoryBot.define do

  sequence :region_name do |n|
    "Fake Region #{n}"
  end

  factory :region do
    #name { Faker::Team.state }
    name { generate(:region_name) }
  end
  
end
