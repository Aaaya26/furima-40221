require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep(1)
  end
  
  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it 'post_codeが空だと購入できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeは半角文字列でなければ購入できない' do
        @order_address.post_code = '１１１－１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeは3桁ハイフン4桁でなければ購入できない' do
        @order_address.post_code = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeは数字でなければ購入できない' do
        @order_address.post_code = 'aaa-aaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefucture_idが未選択だと購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと購入できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'streetが空だと購入できない' do
        @order_address.street = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角文字列でなければ購入できない' do
        @order_address.phone_number = '１１１１１１１１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが数字のみでなければ購入できない' do
        @order_address.phone_number = '111-1111-1111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end