require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end
  describe '商品購入機能' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ""
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'zip_codeが空だと保存できないこと' do
        @order_address.zip_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code can't be blank")
      end
      it 'zip_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.zip_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'city_nameが空だと保存できないこと' do
        @order_address.city_name = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City name can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end
end
