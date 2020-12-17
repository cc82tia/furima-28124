require 'rails_helper'
require 'pp'
require 'item_order'

RSpec.describe ItemOrder, type: :model do
  before do
    @item_order = FactoryBot.build(:item_order)
  end
  
  describe '商品購入' do
    context '購入が上手くいくとき' do
      it '全ての項目の入力が存在すれば購入できる' do
        expect(@item_order).to be_valid
      end
      it '建物名の入力がなくても購入できる' do
        @item_order.building_number = nil
        @item_order.valid?
      end
    end
    
    context '購入がうまくいかないとき' do
      it '郵便番号の入力がないと購入できない' do
        @item_order.postal_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal codeを入力してください", "Postal codeは不正な値です")
      end
      it  '郵便番号にはハイフンがなければ登録できない' do
        @item_order.postal_code = "1234567"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal codeは不正な値です")
      end
      it  '郵便番号7桁でなければ登録できない' do
        @item_order.postal_code = "123-45678"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include()
      end
      it  '郵便番号は3桁の後にハイフンを入力したのちに4桁を入力しなければ登録できない' do
        @item_order.postal_code = "1234-567"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include()
      end

      it '都道府県が空だと購入できない' do
        @item_order.delivery_source_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Delivery sourceを入力してください", "Delivery sourceは--以外を選択して下さい")
      end
      
      it '都道府県が0以外でないと購入できない' do
        @item_order.delivery_source_id = 0
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Delivery sourceは--以外を選択して下さい")
      end
      it '市町村を入力しないと購入できない' do
        @item_order.city = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Cityを入力してください")
      end

      it '番地を入力しないと購入できない' do
        @item_order.house_number = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("House numberを入力してください")
      end

      it '電話番号を入力しないと購入できない' do
        @item_order.phone_number = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone numberを入力してください", "Phone numberは不正な値です")
      end

      it '電話番号にハイフンを入れると購入できない' do
        @item_order.phone_number = 000-0000-000
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone numberは不正な値です")
      end

      it '電話番号は9桁以下だと購入できない' do
        @item_order.phone_number = 123456789
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone numberは不正な値です")
      end

      it '電話番号は12桁以上だと購入できない' do
        @item_order.phone_number = 123456789012
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone numberは不正な値です")
      end
      it "tokenが空では登録できないこと" do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Tokenを入力してください")
      end
    end

  end
end
