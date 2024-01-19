require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できるとき' do
      it '全ての項目に正しく入力したら登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できないとき' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages). to include("Item name can't be blank")
      end
      it 'item_dataが空では出品できない' do
        @item.item_data = ''
        @item.valid?
        expect(@item.errors.full_messages). to include("Item data can't be blank")
      end
      it 'item_categoryが未選択では出品できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages). to include("Item category can't be blank")
      end
      it 'item_statusが未選択では出品できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages). to include("Item status can't be blank")
      end
      it 'chargeが未選択では出品できない' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages). to include("Charge can't be blank")
      end
      it 'purefectureが未選択では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages). to include("Prefecture can't be blank")
      end
      it 'ship_dateが未選択では出品できない' do
        @item.ship_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages). to include("Ship date can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages). to include("Price can't be blank")
      end
      it 'priceが300未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages). to include("Price must be greater than or equal to 300")
      end
      it 'priceが9999999を超えては出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages). to include("Price must be less than or equal to 9999999")
      end
      it 'priceが全角数字では出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages). to include("Price is not a number")
      end
      it 'priceが半角数字以外の文字では出品できない' do
        @item.price = 'thousand'
        @item.valid?
        expect(@item.errors.full_messages). to include("Price is not a number")
      end
      it 'userが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
