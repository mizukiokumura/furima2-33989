require 'rails_helper'

RSpec.describe BuyStreet, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @street = FactoryBot.build(:buy_street, user_id: @user.id, item_id: @item.id)
    sleep(1)
  end

  context '住所が保存できる時' do
    it '全ての情報が入力されていると保存できること' do
      expect(@street).to be_valid
    end
    it 'building_nameがなくても登録できること' do
      @street.building_name = ''
      expect(@street).to be_valid
    end
  end

  context '住所が保存できない時' do
    it 'prefecture_idが0だと保存できないこと' do
      @street.prefecture_id = 0
      @street.valid?
      expect(@street.errors.full_messages).to include("Prefecture must be other than 0")
    end
    it 'postal_codeが入力されていないと保存できないこと' do
      @street.postal_code = nil
      @street.valid?
      expect(@street.errors.full_messages).to include("Postal code can't be blank")

    end
    it 'postal_codeに-(ハイフン)がないと保存できないこと' do
      @street.postal_code = 1234567
      @street.valid?
      expect(@street.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'postal_codeが全角だと保存できないこと' do
      @street.postal_code = '１２３−４５６７'
      @street.valid?
      expect(@street.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'municipalityがないと保存できないこと' do
      @street.municipality = ''
      @street.valid?
      expect(@street.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'municipalityが全額じゃないと保存できないこと' do
      @street.municipality = "hogehoge"
      @street.valid?
      expect(@street.errors.full_messages).to include("Municipality is invalid. Input full-width characters.")
    end
    it 'addressがないと保存できないこと' do
      @street.address = ''
      @street.valid?
      expect(@street.errors.full_messages).to include("Address can't be blank")
    end
  end
end
