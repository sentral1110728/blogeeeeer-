require 'rails_helper'

RSpec.describe Profile, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "profileを登録できること" do
    profile = build(:profile)
    profile.valid?
    expect(profile).to be_valid
  end
end
