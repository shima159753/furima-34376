require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_buyer = FactoryBot.build(:order_buyer, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

    context '購入できるとき' do
      it '全ての項目が確認できれば購入できる' do
        expect(@order_buyer).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @order_buyer.building_name = ''
        expect(@order_buyer).to be_valid
      end
    end

    context '購入できないとき' do
      it 'user_idが空だと保存できないこと' do
        @order_buyer.user_id = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("User can't be blank")
      end

      it 'user_idが空だと保存できないこと' do
        @order_buyer.item_id = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空だと保存できないこと' do
        @order_buyer.token = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @order_buyer.postal_code = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeがにハイフンがないと保存できないこと' do
        @order_buyer.postal_code = '1234567'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'delivery_area_idが0だと保存できないこと' do
        @order_buyer.delivery_area_id = 0
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Delivery area can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @order_buyer.city = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと保存できないこと' do
        @order_buyer.address = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Address can't be blank")
      end

      it 'telが空だと保存できないこと' do
        @order_buyer.tel = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Tel can't be blank")
      end

      it 'telが10桁か11桁の数字でないと保存できないこと' do
        @order_buyer.tel = '333'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Tel is invalid.')
      end

      it 'telが半角数字でないと保存できないこと' do
        @order_buyer.tel = 'あああああaaaaaa'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Tel is invalid.')
      end
    end
  end
end
