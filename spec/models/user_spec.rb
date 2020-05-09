require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "nicknameが空では登録できないこと" do
    user = build(:user, nickname: "")
    user.valid?
    expect(user.errors[:nickname]).to include("が入力されていません。")
  end
  it "nicknameが21文字以上では登録できないこと" do
    user = build(:user, nickname: "アイウエオアイウエオアイウエオアイウエオあ")
    user.valid?
    expect(user.errors[:nickname]).to include("は20文字以下に設定して下さい。")
  end
  it "nicknameが20文字以内では登録できること" do
    user = build(:user, nickname: "アイウエオアイウエオアイウエオアイウエオ")
    user.valid?
    expect(user).to be_valid
  end
  it "emailが空では登録できないこと" do
    user = build(:user, email: "")
    user.valid?
    expect(user.errors[:email]).to include("が入力されていません。")
  end
  it "emailのフォーマットが正しくない(@がない)場合、登録できないこと" do
    user = build(:user, email: "emailaddress")
    user.valid?
    expect(user.errors[:email]).to include("は有効でありません。")
  end
  it "emailに全角文字が入力されていた場合、登録できないこと" do
    user = build(:user, email: "あああ@gmail.com")
    user.valid?
    expect(user.errors[:email]).to include("は有効でありません。")
  end
  it "emailが50文字以上では登録できないこと" do
    user = build(:user, email: "email12345012345678901234567890123456@i.softbank.jp")
    user.valid?
    expect(user.errors[:email]).to include("は50文字以下に設定して下さい。")
  end
  it "passwordが空では登録できないこと" do
    user = build(:user, password: "")
    user.valid?
    expect(user.errors[:password]).to include("が入力されていません。")
  end
  it "passwordが6文字未満では登録できないこと" do
    user = build(:user, password: "12345")
    user.valid?
    expect(user.errors[:password]).to include("は6文字以上に設定して下さい。")
  end
  it "passwordが128文字以上では登録できないこと" do
    password = "#{'12345678' * 8 * 2}1"
    user = build(:user, password: password, password_confirmation: password)
    user.valid?
    expect(user.errors[:password]).to include("は128文字以下に設定して下さい。")
  end
  it "passwordに全角文字が含まれていれば、登録できないこと" do
    user = build(:user, password: "パスワード入力", password_confirmation: "パスワード入力")
    user.valid?
    expect(user.errors[:password]).to include("は有効でありません。")
  end
  it "passwordとpassword_confirmationが違う値の場合、登録できないこと" do
    user = build(:user, password: "password", password_confirmation: "wrongPassword")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("が内容とあっていません。")
  end
  it "nickname,email,password,password_confirmationが正しく入力されていれば、登録できること" do
    user = build(:user)
    user.valid?
    expect(user).to be_valid
  end
end
