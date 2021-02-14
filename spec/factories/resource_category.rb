FactoryBot.define do

  factory :resource_category do
    sequence(:name) { |i| "Fake Resource Category #{i}" }

    trait :active do
        active { true }
    end

    trait :inactive do
        active { false }
    end
  end
  
end