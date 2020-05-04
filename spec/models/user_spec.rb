require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "nicknameが空では登録できないこと" do
    user = build(:user, nickname: "")
    user.valid?
    expect(user.errors[:nickname]).to include("を入力してください")
  end
  it "nicknameが20文字以上では登録できないこと" do
    user = build(:user, nickname: "アイウエオアイウエオアイウエオアイウエオあ")
    user.valid?
    expect(user.errors[:nickname]).to include("は20文字以内で入力してください")
  end
  it "emailが空では登録できないこと" do
    user = build(:user, email: "")
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end
  it "emailのフォーマットが正しくない(@がない)場合、登録できないこと" do
    user = build(:user, email: "emailaddress")
    user.valid?
    expect(user.errors[:email]).to include("は不正な値です")
  end
  it "emailが50文字以上では登録できないこと" do
    user = build(:user, email: "email12345012345678901234567890123456@i.softbank.jp")
    user.valid?
    expect(user.errors[:email]).to include("は50文字以内で入力してください")
  end
  it "passwordが空では登録できないこと" do
    user = build(:user, password: "")
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end
  it "passwordが6文字未満では登録できないこと" do
    user = build(:user, password: "12345")
    user.valid?
    expect(user.errors[:password]).to include("は6文字以上で入力してください")
  end
  it "passwordが128文字以上では登録できないこと" do
    password = "#{'12345678' * 8 * 2}1"
    user = build(:user, password: password, password_confirmation: password)
    user.valid?
    expect(user.errors[:password]).to include("は128文字以内で入力してください")
  end
  it "nickname,email,password,password_confirmationが存在すれば登録できること" do
    user = build(:user)
    user.valid?
    expect(user).to be_valid
  end
end
