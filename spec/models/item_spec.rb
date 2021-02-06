require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '登録できるとき' do
      it '全ての項目が確認できれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '登録できないとき' do
      it '画像が必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が必須であること' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it '商品カテゴリーが必須であること' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it '商品カテゴリーに0が選択されている' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it '商品状態が必須であること' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('State is not a number')
      end
      it '商品状態に0が選択されている' do
        @item.state_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('State must be other than 0')
      end
      it '配達料金負担が必須であること' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee is not a number')
      end
      it '配達料金負担に0が選択されている' do
        @item.delivery_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 0')
      end
      it '配達エリアが必須であること' do
        @item.delivery_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery area is not a number')
      end
      it '配達エリアに0が選択されている' do
        @item.delivery_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery area must be other than 0')
      end
      it '配達日が必須であること' do
        @item.delivery_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery days is not a number')
      end
      it '配達日に0が選択されている' do
        @item.delivery_days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery days must be other than 0')
      end
      it '料金が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '料金が範囲が適性であること' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '料金が半角数字が適性であること' do
        @item.price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end
