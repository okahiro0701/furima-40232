require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品情報入力' do
    context '商品情報入力がうまくいく時' do
      it '全ての値が正しく入力されていれば出品できること' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it "商品名が空では出品できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors[:item_name]).to include("can't be blank")
      end
  
      it "商品説明が空では出品できない" do
        @item.item_explanation = ""
        @item.valid?
        expect(@item.errors[:item_explanation]).to include("can't be blank")
      end
  
      it "カテゴリーが空では出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors[:category_id]).to include("can't be blank")
      end
  
      it "商品の状態が空では出品できない" do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors[:item_condition_id]).to include("can't be blank")
      end
  
      it "配送料の負担が空では出品できない" do
        @item.shipping_fee_burden_id = 1
        @item.valid?
        expect(@item.errors[:shipping_fee_burden_id]).to include("can't be blank")
      end
  
      it "配送元の地域が空では出品できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors[:prefecture_id]).to include("can't be blank")
      end
  
      it "発送までの日数が空では出品できない" do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors[:delivery_time_id]).to include("can't be blank")
      end
  
      it "価格が空では出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors[:price]).to include("can't be blank")
      end
  
      it "価格が数字でない場合（文字列の場合）は、出品できない" do
        @item.price = "aaaa"
        @item.valid?
        expect(@item.errors[:price]).to include("Half-width number.")
      end

      it "商品価格が299円以下では出品できない" do
        @item.price = 200
        @item.valid?
        expect(@item.errors[:price]).to include("Out of setting range")
      end

      it "商品価格が10_000_000円以上では出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors[:price]).to include("Out of setting range")
      end

      it "userが紐づいていないと出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors[:user]).to include("must exist")
      end
      it "画像なしでは出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("can't be blank")
      end
    end
  end
end