FactoryBot.define do
  factory :category do
    category_name {"プログラミング"}
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/猫.jpeg'), 'image/jpeg') }
  end
end