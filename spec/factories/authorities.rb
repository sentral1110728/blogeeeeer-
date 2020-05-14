FactoryBot.define do
  factory :authority do
    name { '一般' }
  end
  factory :admin, class: Authority do
    id { 2 }
    name { '管理者' }
  end
end
