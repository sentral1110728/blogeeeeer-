require 'rails_helper'

RSpec.describe Authority, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it 'nameが存在すれば登録できること' do
    authority = build(:authority)
    authority.valid?
    expect(authority).to be_valid
  end
end
