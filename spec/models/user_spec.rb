require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができる時' do
      it '情報が正しく入力されている時登録できること' do
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない時' do
      
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
      it '重複したemailが存在する場合登録できないこと' do
        user = FactoryBot.build(:user)
        user.save
        @user.email = user.email
        @user.valid?
        expect(@user.errors.full_messages).to include("Email has already been taken")
      end
      
      it 'emailアドレスは、@を含む必要があること' do
        @user.email = 'hogehoge'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = 'hoge5'
        @user.password_confirmation = 'hoge5'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが英数字の混合でなければ登録できない' do
        @user.password = 'hogehoge'
        @user.password_confirmation = 'hogehoge'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Input half-width characters.')
      end
      it 'passwordが入力されていてもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが英数字では登録できない' do
        @user.first_name = 'hogehoge'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが英数字では登録できない' do
        @user.last_name = 'hogehoge'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end
      it 'kana_f_nameが空では登録できない' do
        @user.kana_f_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana f name can't be blank")
      end
      it 'kana_f_nameが英数字だと登録できない' do
        @user.kana_f_name = 'hogehoge2'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana f name is invalid. Input full-width katakana characters.")
      end
      it 'kana_f_nameが漢字だと登録できない' do
        @user.kana_f_name = '武田'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana f name is invalid. Input full-width katakana characters.")
      end
      it 'kana_l_nameが空だと登録できない' do
        @user.kana_l_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana l name can't be blank")
      end
      it 'kana_l_nameが英数字だ登録できない' do
        @user.kana_l_name = 'hogehuga2'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana l name is invalid. Input full-width katakana characters.")
      end
      it 'kana_l_nameが漢字だと登録できない' do
        @user.kana_l_name = '信繁'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana l name is invalid. Input full-width katakana characters.")
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
