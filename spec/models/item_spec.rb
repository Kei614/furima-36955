require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品の登録ができるとき' do
      it '入力情報に問題がなければ、商品の登録ができる' do
        expect(@item).to be_valid
      end
    end

    context '商品の登録ができないとき' do
      # nameに対してのテスト
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      # textに対してのテスト
      it 'textが空では登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      # category_idに対してのテスト
      it 'category_idが空では登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが選択されていない(id = 1)と登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category を選択してください')
      end

      # condition_idに対してのテスト
      it 'condition_idが空では登録できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'condition_idが選択されていない(id = 1)と登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition を選択してください')
      end

      # delivery_chage_idに対してのテスト
      it 'delivery_charge_idが空では登録できない' do
        @item.delivery_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it 'delivery_charge_idが選択されていない(id = 1)と登録できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery charge を選択してください')
      end

      # prefecture_idに対してのテスト
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが選択されていない(id = 1)と登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture を選択してください')
      end

      # days_to_delivery_idに対してのテスト
      it 'days_to_delivery_idが空では登録できない' do
        @item.days_to_delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to delivery can't be blank")
      end
      it 'days_to_delivery_idが選択されていない(id = 1)と登録できない' do
        @item.days_to_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to delivery を選択してください')
      end

      # priceに対してのテスト
      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceに入力される値が全角文字だと登録できない' do
        @item.price = 'ああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300〜9,999,999円の範囲で半角数字で入力してください')
      end
      it 'priceに入力される値が英字だと登録できない' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300〜9,999,999円の範囲で半角数字で入力してください')
      end
      it 'priceに入力される値が英数字混合だと登録できない' do
        @item.price = '123abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300〜9,999,999円の範囲で半角数字で入力してください')
      end
      it 'priceに入力された値が300未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300〜9,999,999円の範囲で半角数字で入力してください')
      end
      it 'priceに入力された値が10,000,000以上だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300〜9,999,999円の範囲で半角数字で入力してください')
      end

      # user(アソシエーション)に対してのテスト
      it 'userが空では登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
      end

      # imageに対してのテスト
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
