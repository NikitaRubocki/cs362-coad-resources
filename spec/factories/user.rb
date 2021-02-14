FactoryBot.define do

  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    organization

    trait 'bad_email' do
      email { 'bad email' }
    end

    trait 'org_role' do
      role { 'organization' }
    end
  end

end