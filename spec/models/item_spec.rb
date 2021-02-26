require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context '商品が出品できる場合' do
      it '画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、配送元の地域、配送までの日数、販売価格があれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it '商品名が空だと出品できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Product name 名前を入力してください'
      end

      it '商品の説明が空だと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Description 商品の説明を入力してください'
      end

      it '画像を添付しないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Image 画像を添付してください'
      end

      it 'カテゴリーを選択しないと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category カテゴリーを選択してください'
      end

      it 'カテゴリーは１を選択すると出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category カテゴリーを選択してください'
      end

      it '商品の状態を選択しないと出品できない' do
        @item.product_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Product status 商品の状態を選択してください'
      end

      it '商品の状態は１を選択すると出品できない' do
        @item.product_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Product status 商品の状態を選択してください'
      end

      it '配送料の負担を選択しないと出品できない' do
        @item.burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Burden 配送料の負担を選択してください'
      end

      it '配送料の負担は１を選択すると出品できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Burden 配送料の負担を選択してください'
      end

      it '配送元の地域を選択しないと出品できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Area 配送元の地域を選択してください'
      end

      it '配送元の地域は１を選択すると出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Area 配送元の地域を選択してください'
      end

      it '配送までの日数を選択しないと出品できない' do
        @item.days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Days 配送までの日数を選択してください'
      end

      it '配送までの日数は１を選択すると出品できない' do
        @item.days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Days 配送までの日数を選択してください'
      end

      it '販売価格が空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '販売価格が299円以下だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price 販売価格は¥300~¥9,999,999としてください'
      end

      it '販売価格が10,000,000円以上だと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price 販売価格は¥300~¥9,999,999としてください'
      end

      it '販売価格は半角数字でないと出品できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. 販売価格は半角数字としてください'
      end

      it '販売価格は英数混合では出品できない' do
        @item.price = 'test01'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. 販売価格は半角数字としてください'
      end

      it '販売価格は半角英語のみでは出品できない' do
        @item.price = 'test'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. 販売価格は半角数字としてください'
      end
    end
  end
end
