require 'rails_helper'

RSpec.describe Comment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it 'commentが空では登録できないこと' do
    comment = build(:comment, comment: '')
    comment.valid?
    expect(comment.errors[:comment]).to include('を入力してください')
  end
  it 'commentが存在すれば登録できること' do
    comment = build(:comment)
    comment.valid?
    expect(comment).to be_valid
  end
end
