FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(8)
    association :authority
    sequence(:nickname) { Faker::Name.last_name }
    sequence(:email) { Faker::Internet.email }
    password              { password }
    password_confirmation { password }
  end

  factory :admin_user, class: User do
    password = Faker::Internet.password(8)
    association :authority, factory: :admin, id: 2
    sequence(:nickname) { Faker::Name.last_name }
    sequence(:email) { Faker::Internet.email }
    password              { password }
    password_confirmation { password }
  end
end
