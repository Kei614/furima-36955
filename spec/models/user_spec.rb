require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録機能' do
    context '新規登録できるとき' do
      it '入力情報に問題がなければ、ユーザー新規登録ができる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nickameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      # Emailへのテスト
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合、登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      # Passwordへのテスト
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = 'def5678'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは数字だけでは登録できない' do
        @user.password = 111_111
        @user.password_confirmation = 111_111
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含むようにしてください')
      end
      it 'passwordは英字だけでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含むようにしてください')
      end

      # Last_nameへのテスト
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが英字だと登録できない' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角(漢字、ひらがな、カタカナ)で入力してください')
      end
      it 'last_nameが数字だと登録できない' do
        @user.last_name = 111
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角(漢字、ひらがな、カタカナ)で入力してください')
      end
      it 'last_nameが半角のカタカナだと登録できない' do
        @user.last_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角(漢字、ひらがな、カタカナ)で入力してください')
      end

      # First_nameへのテスト
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが英字だと登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角(漢字、ひらがな、カタカナ)で入力してください')
      end
      it 'first_nameが数字だと登録できない' do
        @user.first_name = 111
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角(漢字、ひらがな、カタカナ)で入力してください')
      end
      it 'first_nameが半角のカタカナだと登録できない' do
        @user.first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角(漢字、ひらがな、カタカナ)で入力してください')
      end

      # Last_name_in_kanaのテスト
      it 'last_name_in_kanaが空では登録できない' do
        @user.last_name_in_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name in kana can't be blank")
      end
      it 'last_name_in_kanaは、ひらがなでは登録できない' do
        @user.last_name_in_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name in kana はカタカナ(全角)で入力してください')
      end
      it 'last_name_in_kanaは、漢字では登録できない' do
        @user.last_name_in_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name in kana はカタカナ(全角)で入力してください')
      end
      it 'last_name_in_kanaは、半角のカタカナでは登録できない' do
        @user.last_name_in_kana = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name in kana はカタカナ(全角)で入力してください')
      end
      it 'last_name_in_kanaは、英字では登録できない' do
        @user.last_name_in_kana = 'Yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name in kana はカタカナ(全角)で入力してください')
      end
      it 'last_name_in_kanaは、数字では登録できない' do
        @user.last_name_in_kana = 111
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name in kana はカタカナ(全角)で入力してください')
      end

      # First_name_in_kanaへのテスト
      it 'first_name_in_kanaが空では登録できない' do
        @user.first_name_in_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name in kana can't be blank")
      end
      it 'first_name_in_kanaは、ひらがなでは登録できない' do
        @user.first_name_in_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name in kana はカタカナ(全角)で入力してください')
      end
      it 'first_name_in_kanaは、漢字では登録できない' do
        @user.first_name_in_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name in kana はカタカナ(全角)で入力してください')
      end
      it 'first_name_in_kanaは、半角のカタカナでは登録できない' do
        @user.first_name_in_kana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name in kana はカタカナ(全角)で入力してください')
      end
      it 'first_name_in_kanaは、英字では登録できない' do
        @user.first_name_in_kana = 'Taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name in kana はカタカナ(全角)で入力してください')
      end
      it 'first_name_in_kanaは、数字では登録できない' do
        @user.first_name_in_kana = 111
        @user.valid?
        expect(@user.errors.full_messages).to include('First name in kana はカタカナ(全角)で入力してください')
      end

      # Date_of_birthへのテスト
      it 'date_of_birthが空では登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
      
    end
  end
end
