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
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it '商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品説明が必須であること' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it '商品カテゴリーが必須であること' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーは数値で入力してください')
      end
      it '商品カテゴリーに0が選択されている' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーは0以外の値にしてください')
      end
      it '商品状態が必須であること' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態は数値で入力してください')
      end
      it '商品状態に0が選択されている' do
        @item.state_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態は0以外の値にしてください')
      end
      it '配達料金負担が必須であること' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担は数値で入力してください')
      end
      it '配達料金負担に0が選択されている' do
        @item.delivery_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担は0以外の値にしてください')
      end
      it '配達エリアが必須であること' do
        @item.delivery_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域は数値で入力してください')
      end
      it '配達エリアに0が選択されている' do
        @item.delivery_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域は0以外の値にしてください')
      end
      it '配達日が必須であること' do
        @item.delivery_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数は数値で入力してください')
      end
      it '配達日に0が選択されている' do
        @item.delivery_days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数は0以外の値にしてください')
      end
      it '料金が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end

      it '料金が299円では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は一覧にありません')
      end
      it '料金が10000000円では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は一覧にありません')
      end
      it '半角英数字混合のとき出品できない' do
        @item.price = 'aaa111'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は一覧にありません')
      end
      it '半角英語では出品できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は一覧にありません')
      end
      it '全角文字では出品できない' do
        @item.price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は一覧にありません')
      end
    end
  end
end
