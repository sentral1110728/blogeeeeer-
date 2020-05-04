FactoryBot.define do
  factory :profile do
    association :user
    appeal {"よろしく！"}
    user_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/猫.jpeg'), 'image/jpeg') }
  end
end
