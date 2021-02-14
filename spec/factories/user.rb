FactoryBot.define do

  factory :user do
    email { Faker::Internet.email }
    password { 'fakepassword' }
    password_confirmation { 'fakepassword' }

    trait 'bad_email' do
      email { 'bad email' }
    end

    trait 'org_role' do
      organization
      role { 'organization' }
    end

    trait 'admin_role' do
      role { 'admin' }
    end
  end

end