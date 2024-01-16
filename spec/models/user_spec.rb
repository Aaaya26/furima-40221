require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目に正しく入力したら登録できる' do
        user = User.new(nickname: 'taro', email: 'test@example', password: 'a00000', password_confirmation: 'a00000', family_name: '田なカ', first_name: '太ろウ', family_name_kana: 'タナカ', first_name_kana: 'タロウ', birthday: '2000/12/12')
        expect(user).to be_valid
      end
    end

    context '新規登録できないとき/ユーザー情報' do
      it 'nicknameが空では登録できない' do
        user = User.new(nickname: '', email: 'test@example', password: 'a00000', password_confirmation: 'a00000', family_name: '田なカ', first_name: '太ろウ', family_name_kana: 'タナカ', first_name_kana: 'タロウ', birthday: '2000/12/12')
        user.valid?
        expect(user.errors.full_messages). to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        user = User.new(nickname: 'taro', email: '', password: 'a00000', password_confirmation: 'a00000', family_name: '田なカ', first_name: '太ろウ', family_name_kana: 'タナカ', first_name_kana: 'タロウ', birthday: '2000/12/12')
        user.valid?
        expect(user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        user = User.new(nickname: 'taro', email: 'test@example', password: 'a00000', password_confirmation: 'a00000', family_name: '田なカ', first_name: '太ろウ', family_name_kana: 'タナカ', first_name_kana: 'タロウ', birthday: '2000/12/12')
        user.save
        another_user = User.new(nickname: 'joro', email: 'test@example', password: 'a00000', password_confirmation: 'a00000', family_name: '田なカ', first_name: '太ろウ', family_name_kana: 'タナカ', first_name_kana: 'タロウ', birthday: '2000/12/12')
        another_user.email = user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに＠が含まれていなければ登録できない' do
        user = User.new(nickname: 'taro', email: 'test', password: 'a00000', password_confirmation: 'a00000', family_name: '田なカ', first_name: '太ろウ', family_name_kana: 'タナカ', first_name_kana: 'タロウ', birthday: '2000/12/12')
        user.valid?
        expect(user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        user = User.new(nickname: 'taro', email: 'test@example', password: '', password_confirmation: '', family_name: '田なカ', first_name: '太ろウ', family_name_kana: 'タナカ', first_name_kana: 'タロウ', birthday: '2000/12/12')
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字以上なければ登録できない' do
        user = User.new(nickname: 'taro', email: 'test@example', password: 'a0000', password_confirmation: 'a0000', family_name: '田なカ', first_name: '太ろウ', family_name_kana: 'タナカ', first_name_kana: 'タロウ', birthday: '2000/12/12')
        user.valid?
        expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordは半角英数字混合でなければ登録できない' do
        user = User.new(nickname: 'taro', email: 'test@example', password: '000000', password_confirmation: '000000', family_name: '田なカ', first_name: '太ろウ', family_name_kana: 'タナカ', first_name_kana: 'タロウ', birthday: '2000/12/12')
        user.valid?
        expect(user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        user = User.new(nickname: 'taro', email: 'test@example', password: 'a00000', password_confirmation: 'b00000', family_name: '田なカ', first_name: '太ろウ', family_name_kana: 'タナカ', first_name_kana: 'タロウ', birthday: '2000/12/12')
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

    context '新規登録できないとき/本人情報確認' do
      it 'family_nameが空では登録できない' do
        user = User.new(nickname: 'taro', email: 'test@example', password: 'a00000', password_confirmation: 'a00000', family_name: '', first_name: '太ろウ', family_name_kana: 'タナカ', first_name_kana: 'タロウ', birthday: '2000/12/12')
        user.valid?
        expect(user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        user = User.new(nickname: 'taro', email: 'test@example', password: 'a00000', password_confirmation: 'a00000', family_name: '田なカ', first_name: '', family_name_kana: 'タナカ', first_name_kana: 'タロウ', birthday: '2000/12/12')
        user.valid?
        expect(user.errors.full_messages).to include("First name can't be blank")
      end
      it 'family_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        user = User.new(nickname: 'taro', email: 'test@example', password: 'a00000', password_confirmation: 'a00000', family_name: 'Ｕser', first_name: '太ろウ', family_name_kana: 'タナカ', first_name_kana: 'タロウ', birthday: '2000/12/12')
        user.valid?
        expect(user.errors.full_messages).to include("Family name is invalid")
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        user = User.new(nickname: 'taro', email: 'test@example', password: 'a00000', password_confirmation: 'a00000', family_name: '田なカ', first_name: 'Ｕser', family_name_kana: 'タナカ', first_name_kana: 'タロウ', birthday: '2000/12/12')
        user.valid?
        expect(user.errors.full_messages).to include("First name is invalid")
      end
      it 'family_name_kanaが空では登録できない' do
        user = User.new(nickname: 'taro', email: 'test@example', password: 'a00000', password_confirmation: 'a00000', family_name: '田なカ', first_name: '太ろウ', family_name_kana: '', first_name_kana: 'タロウ', birthday: '2000/12/12')
        user.valid?
        expect(user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        user = User.new(nickname: 'taro', email: 'test@example', password: 'a00000', password_confirmation: 'a00000', family_name: '田なカ', first_name: '太ろウ', family_name_kana: 'タナカ', first_name_kana: '', birthday: '2000/12/12')
        user.valid?
        expect(user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'family_name_kanaが全角（カタカナ）でなければ登録できない' do
        user = User.new(nickname: 'taro', email: 'test@example', password: 'a00000', password_confirmation: 'a00000', family_name: '田なカ', first_name: '太ろウ', family_name_kana: '田なｶt', first_name_kana: 'タロウ', birthday: '2000/12/12')
        user.valid?
        expect(user.errors.full_messages).to include("Family name kana is invalid")
      end
      it 'first_name_kanaが全角（カタカナ）でなければ登録できない' do
        user = User.new(nickname: 'taro', email: 'test@example', password: 'a00000', password_confirmation: 'a00000', family_name: '田なカ', first_name: '太ろウ', family_name_kana: 'タナカ', first_name_kana: '太ろｳt', birthday: '2000/12/12')
        user.valid?
        expect(user.errors.full_messages).to include("First name kana is invalid")
      end
      it 'birthdayが空では登録できない' do
        user = User.new(nickname: 'taro', email: 'test@example', password: 'a00000', password_confirmation: 'a00000', family_name: '田なカ', first_name: '太ろウ', family_name_kana: 'タナカ', first_name_kana: 'タロウ', birthday: '')
        user.valid?
        expect(user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

