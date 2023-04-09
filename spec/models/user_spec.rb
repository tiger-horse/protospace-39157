require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nameとemailとprofileとoccupationとposition、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'emailが空では登録できない' do
        @user.email= ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end 

      it 'emailは@を含まないと登録できない' do
        @user.email = 'textmail'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空では登録できない' do
        @user.password= ''
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '654321'
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'nameが空では登録できない' do
        @user.name= ''
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      
      it 'profileが空では登録できない' do
        @user.profile= ''
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Profile can't be blank")
      end
      it 'occupationが空では登録できない' do
        @user.occupation= ''
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Occupation can't be blank")
      end
      it 'positionが空では登録できない' do
        @user.position= ''
        @user.valid?
        # binding.pry
        expect(@user.errors.full_messages).to include("Position can't be blank")
      end
    end
  
  end
end
