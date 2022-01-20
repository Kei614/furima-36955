require 'rails_helper'

RSpec.describe PurchaseRecordDestination, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_record_destination = FactoryBot.build(:purchase_record_destination, user_id: user.id,item_id: item.id,price: item.price)
      sleep 0.2
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_record_destination).to be_valid
      end
      it 'buildiingは空でも保存できること' do
        @purchase_record_destination.building = ""
        expect(@purchase_record_destination).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'zip_codeが空だと保存できないこと' do
        @purchase_record_destination.zip_code = nil
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Zip code can't be blank")
      end
      it 'zip_codeが数字だけだと保存できないこと' do
        @purchase_record_destination.zip_code = "1234567"
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Zip code は、ハイフンを含めて半角数字で入力してください。例：111-1111")
      end
      it 'zip_codeの数字が全角だと保存できないこと' do
        @purchase_record_destination.zip_code = "１２３-４５６７"
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Zip code は、ハイフンを含めて半角数字で入力してください。例：111-1111")
      end
      it 'zip_codeのハイフンが全角だと保存できないこと' do
        @purchase_record_destination.zip_code = "123－4567"
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Zip code は、ハイフンを含めて半角数字で入力してください。例：111-1111")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchase_record_destination.prefecture_id = 1
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Prefecture を選択してください")
      end
      it 'cityが空だと保存できないこと' do
        @purchase_record_destination.city = ""
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @purchase_record_destination.address = ""
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @purchase_record_destination.telephone_number = ""
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが9桁以下だと保存できないこと' do
        @purchase_record_destination.telephone_number = "123456789"
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Telephone number is too short (minimum is 10 characters)")
      end
      it 'telephone_numberが12桁以上だと保存できないこと' do
        @purchase_record_destination.telephone_number = "012345678910"
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Telephone number is too long (maximum is 11 characters)")
      end
      it 'telephone_numberがハイフンを含むと保存できないこと' do
        @purchase_record_destination.telephone_number = "090-1234-5678"
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Telephone number は、半角数字のみで10~11文字で入力してください")
      end
      it 'telephone_numberが全角だと保存できないこと' do
        @purchase_record_destination.telephone_number = "０９０１２３４５６７８"
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Telephone number は、半角数字のみで10~11文字で入力してください")
      end
      it 'telephone_numberは数字以外では保存できないこと' do
        @purchase_record_destination.telephone_number = "あいうえおかきくけこ"
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Telephone number は、半角数字のみで10~11文字で入力してください")
      end
      
      it 'userが紐付いていないと保存できないこと' do
        @purchase_record_destination.user_id = nil
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_record_destination.item_id = nil
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Item can't be blank")
      end
      it 'priceが空だと保存できないこと' do
        @purchase_record_destination.price = nil
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Price can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @purchase_record_destination.token = ""
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
