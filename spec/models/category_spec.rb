require 'rails_helper'

RSpec.describe Category, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '#create #update' do
    it "category_nameが空では登録できないこと" do
      category = build(:category, category_name: "")
      category.valid?
      expect(category.errors[:category_name]).to include("を入力してください")
    end
    it "category_nameが20文字以上であれば登録できないこと" do
      category = build(:category, category_name: "アイウエオアイウエオアイウエオアイウエオあ")
      category.valid?
      expect(category.errors[:category_name]).to include("は20文字以内で入力してください")
    end
    it "imageが空では登録できないこと" do
      category = build(:category, image: nil)
      category.valid?
      expect(category.errors[:image]).to include("を入力してください")
    end
    it "category_nameが20文字以内かつ、imageが存在すれば登録できること" do
      category = build(:category, category_name: "アイウエオアイウエオアイウエオアイウエオ")
      category.valid?
      expect(category).to be_valid
    end
  end

end
