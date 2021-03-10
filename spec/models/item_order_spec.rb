require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '商品の購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @item_order = FactoryBot.build(:item_order, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '商品が購入できる場合' do
      it 'カード情報、有効期限、セキュリティーコード、郵便番号、都道府県、市区町村、地番、建物名、電話番号を入力すると、商品の購入ができること' do
        expect(@item_order).to be_valid
      end

      it '建物名は空でも登録できる' do
        @item_order.building_name = ''
        expect(@item_order).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'カード情報、有効期限、セキュリティーコードが空だと購入出来ない' do
        @item_order.token = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include "Token can't be blank"
      end

      it '郵便番号が空だと入力できない' do
        @item_order.postal_code = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include "Postal code can't be blank"
      end

      it '郵便番号は(-)がないと購入出来ない' do
        @item_order.postal_code = '1234567'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include 'Postal code には（-）を含めてください'
      end

      it '都道府県は選択しなければ購入出来ない' do
        @item_order.area_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include 'Area 配送元の地域を選択してください'
      end

      it '市区町村は入力しなければ購入出来ない' do
        @item_order.city = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include "City can't be blank", 'City には全角文字を使用してください'
      end

      it '市区町村は半角英数文字は購入できない' do
        @item_order.city = 'aaaaa'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include 'City には全角文字を使用してください'
      end

      it '地番は入力しなければ購入出来ない' do
        @item_order.house_num = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include "House num can't be blank"
      end

      it '地番は半角英数文字では購入できない' do
        @item_order.house_num = '123abcd'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include 'House num には全角文字を使用してください'
      end

      it '建物名は半角英数文字では購入できない' do
        @item_order.building_name = 'aaa'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include 'Building name には全角文字を使用してください'
      end

      it '電話番号は入力しなければ購入できない' do
        @item_order.phone = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include "Phone can't be blank"
      end

      it '電話番号は半角数字でなければ購入できない' do
        @item_order.phone = '１２３４５６７８９０９'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include 'Phone には半角数字のみで12文字以下としてください'
      end

      it '電話番号は半角数字のみでないと登録できない' do
        @item_order.phone = 'abcdefghij'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include 'Phone には半角数字のみで12文字以下としてください'
      end

      it '電話番号は12桁以上だと登録できない' do
        @item_order.phone = 123456789098765
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include 'Phone には半角数字のみで12文字以下としてください'
      end

      it 'user_idが空では購入できない' do
        @item_order.user_id = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include "User can't be blank"
      end

      it 'item_idが空では購入できない' do
        @item_order.item_id = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
