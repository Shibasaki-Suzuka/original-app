require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、password、password_confirmation、last_nameとfirst_name、last_name_hiraganaとfirst_name_hiragana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが数字だけでは登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end
      it 'passwordが英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが全角文字を含むパスワードでは登録できない' do
        @user.password = 'あいうえおか'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが英字では登録できない' do
        @user.last_name = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
      end
      it 'first_nameが英字では登録できない' do
        @user.first_name = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end
      it 'last_name_hiraganaが空では登録できない' do
        @user.last_name_hiragana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name hiragana can't be blank")
      end
      it 'first_name_hiraganaが空では登録できない' do
        @user.first_name_hiragana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name hiragana can't be blank")
      end
      it 'last_name_hiraganaが英字では登録できない' do
        @user.last_name_hiragana = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name hiragana はひらがなで入力して下さい。')
      end
      it 'first_name_hiraganaが英字では登録できない' do
        @user.first_name_hiragana = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name hiragana はひらがなで入力して下さい。')
      end
      it 'last_name_hiraganaが漢字では登録できない' do
        @user.last_name_hiragana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name hiragana はひらがなで入力して下さい。')
      end
      it 'first_name_hiraganaが漢字では登録できない' do
        @user.first_name_hiragana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name hiragana はひらがなで入力して下さい。')
      end
      it 'last_name_hiraganaがカタカナでは登録できない' do
        @user.last_name_hiragana = 'カタカナ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name hiragana はひらがなで入力して下さい。')
      end
      it 'first_name_hiraganaがカタカナでは登録できない' do
        @user.first_name_hiragana = 'カタカナ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name hiragana はひらがなで入力して下さい。')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
