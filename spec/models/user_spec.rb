require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、last_name、first_name、kana_last_name、kana_first_name、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上の半角英数字" do
        @user.password = "abc123"
        @user.password_confirmation = "abc123"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailは、@を含む必要がある" do
        @user.email = "samplesample.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "abc12"
        @user.password_confirmation = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "kana_last_nameは、漢字・ひらがなを受け付けない" do
        @user.kana_last_name = "漢字・ひらがな"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name 全角文字を使用してください")
      end
      it "kana_first_nameは、漢字・ひらがなを受け付けない" do
        @user.kana_first_name = "漢字・ひらがな"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name 全角文字を使用してください")
      end
      it "last_nameは、半角を受け付けない" do
        @user.last_name = "ﾊﾝｶｸ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it "first_nameは、半角を受け付けない" do
        @user.first_name = "ﾊﾝｶｸ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it "kana_last_nameは、半角を受け付けない" do
        @user.kana_last_name = "ﾊﾝｶｸ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name 全角文字を使用してください")
      end
      it "kana_first_nameは、半角を受け付けない" do
        @user.kana_first_name = "ﾊﾝｶｸ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name 全角文字を使用してください")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end