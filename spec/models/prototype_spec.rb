require 'rails_helper'

RSpec.describe Prototype, type: :model do
  before do
    @prototype = FactoryBot.build(:prototype)
  end

  describe 'プロトタイプ投稿' do
    context 'プロトタイプが投稿できる場合' do
      it 'contentとimageが存在していれば保存できる' do
        
      end
    end

    context 'プロトタイプが投稿できない場合' do
      it 'titleが空では保存できない' do
        @prototype.title= ''
        @prototype.valid?
        # binding.pry
        expect(@prototype.errors.full_messages).to include("Title can't be blank")
      end
      
      it 'catch_copyが空では保存できない' do      
        @prototype.catch_copy= ''
        @prototype.valid?
        # binding.pry
        expect(@prototype.errors.full_messages).to include("Catch copy can't be blank")
      end      
      
      it 'conceptが空では保存できない' do 
        @prototype.concept= ''
        @prototype.valid? 
        expect(@prototype.errors.full_messages).to include("Concept can't be blank")
      end

      it 'imageが空では保存できない' do
        @prototype.image= nil
        @prototype.valid?
        # binding.pry
        expect(@prototype.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
