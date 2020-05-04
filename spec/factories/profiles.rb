FactoryBot.define do
  factory :profile do
    association :user
    appeal {"管理者です。よろしく！"}
    user_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/猫.jpeg'), 'image/jpeg') }
  end
end
