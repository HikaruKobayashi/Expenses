require 'rails_helper'

RSpec.describe FixedCost, type: :model do
  describe 'バリデーション' do
    it 'nameが設定されていれば成功' do
      user = FactoryBot.build(:user)
      expect(@user.valid?).to eq(true)
    end

    it 'nameが空だと失敗' do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'emailが空だと失敗' do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
  end
end
