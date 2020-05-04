FactoryBot.define do
  factory :article do
    association :category
    association :user
    title {"タイトル"}
    content {"内容"}
  end
end
