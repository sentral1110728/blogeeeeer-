FactoryBot.define do
  factory :article do
    association :category
    association :user
    title
    content 
  end
end
