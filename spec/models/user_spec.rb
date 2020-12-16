require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it 'nickname.email.password.password_confirmation.first_name.last_name.first_name_kana.last_name_kana.生年月日が存在すれば登録できる'do
       expect(@user).to be_valid
      end
      it 'passwordが6文字以上,英数字混合であれば登録できる'do
        @user.password = "kuroda1"
        expect(@user).to be_valid
      end
      it 'passwordに英数字が含まれることできれば登録できる'do
        @user.password = "kuroda1"
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが一致すれば登録できる'do
        @user.password = "kuroda1"
        @user.password_confirmation = "kuroda1"
        expect(@user).to be_valid
      end
      it 'first_name_kanaがカタカナであれば登録できる'do
        @user.first_name_kana = "クロタ"
        expect(@user).to be_valid
      end
      it 'last_name_kanaがカタカナであれば登録できる'do
        @user.last_name_kana = "ヒロキ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき'do
       it 'nicknameが空'do
         @user.nickname = ""
         @user.valid?
         expect(@user.errors.full_messages).to include("Nickname can't be blank")
       end
       it 'emailが空'do
         @user.email = ""
         @user.valid?
         expect(@user.errors.full_messages).to include("Email can't be blank")
       end
       it 'emailが一意性がない'do
       @user.save
       another_user = FactoryBot.build(:user, email: @user.email)
       another_user.valid?
       expect(another_user.errors.full_messages).to include("Email has already been taken")
       end
       it 'emailに＠が含まれない'do
         @user.email = "aaaaa"
         @user.valid?
         expect(@user.errors.full_messages).to include
       end
       it 'passwordが空'do
         @user.password = ""
         @user.valid?
         expect(@user.errors.full_messages).to include("Password can't be blank")
       end
       it 'passwordが5文字以下'do
         @user.password = "00000"
         @user.password_confirmation = "00000"
         @user.valid?
         expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
       end
       
       it 'passwordとpassword_confirmationが一致していない'do
         @user.password = "123456"
         @user.password_confirmation = "1234567"
         @user.valid?
         expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
       end
       it 'first_nameが空'do
         @user.first_name = ""
         @user.valid?
         expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
       end
       it 'last_nameが空'do
         @user.last_name = ""
         @user.valid?
         expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
       end
       it 'first_name_kanaが空'do
         @user.first_name_kana = ""
         @user.valid?
         expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
      end
       it 'last_name_kanaが空'do
         @user.last_name_kana = ""
         @user.valid?
         expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
        
      end
       it '生年月日が空'do
         @user.birthday = ""
         @user.valid?
         expect(@user.errors.full_messages).to include("Birthday can't be blank")
       end
      
       it 'first_name_kanaがカタカナでない'do
         @user.first_name_kana = "aaaaa"
         @user.valid?
         expect(@user.errors.full_messages).to include()
       end
       it 'last_name_kanaがカタカナでない'do
         @user.first_name_kana = "aaaaa"
         @user.valid?
         expect(@user.errors.full_messages).to include()
       end

    end
    end
  end
end
  
    
    
  

