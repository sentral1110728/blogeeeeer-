require 'rails_helper'

RSpec.describe Profile, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "profileを更新できること" do
    profile = build(:profile)
    profile.valid?
    expect(profile).to be_valid
  end

  it "profileのappealが空でも更新できること" do
    profile = build(:profile, appeal: "")
    profile.valid?
    expect(profile).to be_valid
  end
end
