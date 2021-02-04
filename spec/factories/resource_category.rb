FactoryBot.define do

  sequence :name do |n|
    "Fake Resource #{n}"
  end

  factory :resource_category do
    name

    trait :active do
        active { true }
    end

    trait :inactive do
        active { false }
    end
  end
  
end