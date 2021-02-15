require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が確認できれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'ニックネームが必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと）' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）' do
        @user.password = 'password'
        @user.password_confirmation = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end
      it 'パスワードは、確認用を含めて2回入力すること' do
        @user.password = 'password1'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
        @user.password = 'password1'
        @user.password_confirmation = 'password2'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'ユーザー本名は、名字が必須であること' do
        @user.last_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓（全角）を入力してください")
      end
      it 'ユーザー本名は、名前が必須であること' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名（全角）を入力してください")
      end
      it 'ユーザー名字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.last_name_kanji = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓（全角）全角文字を使用してください')
      end
      it 'ユーザー名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name_kanji = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('名（全角）全角文字を使用してください')
      end
      it 'ユーザー本名のフリガナは、名字が必須であること' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓（カナ・全角）を入力してください")
      end
      it 'ユーザー本名のフリガナは、名前がそれぞれ必須であること' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名（カナ・全角）を入力してください")
      end
      it 'ユーザー名字のフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.last_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓（カナ・全角）全角カナを使用してください')
      end
      it 'ユーザー名前のフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('名（カナ・全角）全角カナを使用してください')
      end
      it '生年月日が必須であること' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end
