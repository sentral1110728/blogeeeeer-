require 'rails_helper'

RSpec.describe Like, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "article_id,user_idが存在すれば登録できること" do
    like = build(:like)
    like.valid?
    expect(like).to be_valid
  end
end
