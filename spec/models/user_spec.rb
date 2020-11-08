require 'rails_helper'
RSpec.describe User, type: :request do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての項目の入力が存在すれば登録できること" do
        expect(@user).to be_valid
      end
      it "passwordが英数字混合6文字以上であれば登録できる" do
        @user.password = "t000000"
        @user.password_confirmation = "t000000"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nicknameを入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "登録済のemailだと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "emailに＠がないと登録できない" do
        @user.email = have_content("@")
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "passwordが空だと登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが６文字以下だと登録できない" do
        @user.password = "t1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角6文字以上の英文字・数字それぞれ１文字以上含む必要があります")
      end
      it "passwordが数字のみだと登録できない" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include( "パスワードは半角6文字以上の英文字・数字それぞれ１文字以上含む必要があります")
      end
      it "passwordが英字のみだと登録できない" do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include( "パスワードは半角6文字以上の英文字・数字それぞれ１文字以上含む必要があります")
      end
      it "password_confirmationが空では登録できない" do
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      it "family_nameが空だと登録できない" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family nameを入力してください")
      end
      it 'family_nameが全角入力でなければ登録できないこと' do
        @user.family_name= "ｱ"
        @user.valid?
        expect(@user.errors[:family_name]).to include("は全角で入力してください。")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First nameを入力してください")
      end
      it 'first_nameが全角入力でなければ登録できないこと' do
        @user.first_name= "ｱ"
        @user.valid?
        expect(@user.errors[:first_name]).to include("は全角で入力してください。")
      end
      it "family_name_readingが空だと登録できない" do
        @user.family_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name readingを入力してください")
      end
      it 'family_name_readingが全角カナ入力でなければ登録できないこと' do
        @user.family_name_reading= "あ"
        @user.valid?
        expect(@user.errors[:family_name_reading]).to include("は全角カタカナで入力して下さい。")
      end
      it "first_name_readingが空では登録できない" do
        @user.first_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name readingを入力してください")
      end
      it 'first_name_readingが全角カナ入力でなければ登録できないこと' do
        @user.first_name_reading= "あ"
        @user.valid?
        expect(@user.errors[:first_name_reading]).to include("は全角カタカナで入力して下さい。")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdayを入力してください")
      end 
    end
  end
end