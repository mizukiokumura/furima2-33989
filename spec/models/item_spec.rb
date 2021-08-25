require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できる時' do
      it '情報が正しく入力されていると登録できる。' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない時' do
      it '商品名がないと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明がないと出品できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it 'カテゴリーが---だと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が---だと出品できない' do
        @item.state_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it '配送料の負担が---だと出品できない' do
        @item.delivery_fee_burden_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee burden can't be blank")
      end
      it '発送元の地域が---だと出品できない' do
        @item.shipment_source_prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source prefecture can't be blank")
      end
      it '発送までの日数が---だと出品できない' do
        @item.days_to_ship_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it '販売価格が設定されていないと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '販売価格が300円以下だと出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '販売価格が9,999,999円以上だと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '販売価格が半角数字でなければ登録できない' do
        @item.price = '３３３３'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '画像が添付されていないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

    end

  end

end
