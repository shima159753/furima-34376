require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
   context "新規登録できるとき" do
    it "全ての項目が確認できれば登録できる" do
      expect(@user).to be_valid
    end
    it "emailに@があれば登録できる" do
      @user.email = 'test@test'
      expect(@user).to be_valid
    end
    it "passwordとpassword_confirmationが6文字以上であれば登録できる" do
      @user.password = 'password1'
      @user.password_confirmation = 'password1'
      expect(@user).to be_valid
    end
    it "名字が全角であれば登録できる" do
      @user.last_name_kanji = '山田'
      @user.valid?
      expect(@user).to be_valid
    end
    it "名前が全角であれば登録できる" do
      @user.first_name_kanji = '太郎'
      @user.valid?
      expect(@user).to be_valid
    end
    it "名字がカナ全角であれば登録できる" do
      @user.last_name_kana = 'ヤマダ'
      @user.valid?
      expect(@user).to be_valid
    end
    it "名前がカナ全角であれば登録できる" do
      @user.first_name_kana = 'タロウ'
      @user.valid?
      expect(@user).to be_valid
    end
   end




   context "新規登録できないとき" do
    it 'ニックネームが必須であること' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'test'
      @user.valid?
      expect(@user).to be_invalid
    end
    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと）' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）' do
      @user.password = 'password'
      @user.password_confirmation = 'password'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end
    it 'パスワードは、確認用を含めて2回入力すること' do
      @user.password = 'password1'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
      @user.password = 'password1'
      @user.password_confirmation = 'password2'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

      it 'ユーザー本名は、名字が必須であること' do
        @user.last_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
      end
      it 'ユーザー本名は、名前が必須であること' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
     end
     it 'ユーザー名字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.last_name_kanji = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kanji 全角文字を使用してください')
     end
     it 'ユーザー名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name_kanji = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kanji 全角文字を使用してください')
    end
    it 'ユーザー本名のフリガナは、名字が必須であること' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'ユーザー本名のフリガナは、名前がそれぞれ必須であること' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'ユーザー名字のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.last_name_kana = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana 全角カナを使用してください')
    end
    it 'ユーザー名前のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.first_name_kana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana 全角カナを使用してください')
    end
    it '生年月日が必須であること' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
   end
  end
end
