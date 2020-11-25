require 'rails_helper'
require 'pp'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/item-sample.png')
  end

  describe '商品出品' do
    context '出品が上手くいくとき' do
      it '全ての項目の入力が存在すれば登録できる' do
        @item = FactoryBot.create(:item)
        @item.image = fixture_file_upload('app/assets/images/item-sample.png')
        expect(@item).to be_valid
        # pp @item
      end
    end

    context '出品が上手くいかないとき' do
      # before do
      #   @item = FactoryBot.build(:item)
      # end
        it '商品名がないと登録できない' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Nameを入力してください")
        end
        it '商品名が40字以上だと登録できない' do
          @item.name = 'a' * 41
          @item.valid?
          expect(@item.errors.full_messages).to include( "Nameは40字以内にて入力して下さい")
        end
        it '商品説明が40字がない登録できない' do
          @item.description = nil
          @item.valid?
          expect(@item.errors.full_messages).to include( "Descriptionを入力してください")
        end
        it '商品説明が1000字以上だと登録できない' do
          @item.description = 'a' * 1001
          @item.valid?
          expect(@item.errors.full_messages).to include( "Descriptionは1,000字以内にて入力して下さい")
        end
        it '商品状態が1だと登録できない' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include( "Conditionは--以外を選択して下さい")
        end
        it '発送手数料が1だと登録できない' do
          @item.delivery_charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include( "Delivery chargeは--以外を選択して下さい")
        end
        it '発送地が0だと登録できない' do
          @item.delivery_source_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include( "Delivery sourceは--以外を選択して下さい")
        end
        it '販売価格が300円以下だとと登録できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include( "Priceは300円から9,999,999円の間で設定して下さい")
        end
        it '販売価格が9,999,999円以上だと登録できない' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include( "Priceは300円から9,999,999円の間で設定して下さい")
        end
        it 'カテゴリーが1だと登録できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include( "Categoryは--以外を選択して下さい")
        end
        it "ユーザーが紐付いていないとツイートは保存できない" do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Userを入力してください")
        end
    end
  end
end