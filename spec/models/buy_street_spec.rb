require 'rails_helper'

RSpec.describe BuyStreet, type: :model do
  before do 
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
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

    context '住所が保存できない時' do
      it 'prefecture_idが0だと保存できないこと' do
        @street.prefecture_id = 0
        @street.valid?
        expect(@street.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'postal_codeが入力されていないと保存できないこと' do
      end
      it 'postal_codeにハイフン(-)がないと保存できないこと ' do
      end
      it 'postal_codeが正しい形じゃないと保存できないこと' do
        
      end
      it 'municipalityが全角じゃないと保存できないこと' do

      end
      it 'addressがないと保存できないこと' do

      end
      it 'addressが全角じゃないと保存できないこと' do

      end
      it 'phone_numberがないと保存できないこと' do
        
      end
      it 'phone_numberが半角数字じゃないと保存できないこと' do
        
      end
      it 'phone_numberが11桁ないと保存できないこと' do
        
      end
      it 'phone_nmuberが11桁以上だと保存できないこと' do
        
      end
      it 'tokenが空だと保存できないこと' do
      
      end
      it 'user_idが空だと保存できないこと' do
        
      end
      it 'item_idが空だと保存できないこと' do
        
      end
    end


  end


end
