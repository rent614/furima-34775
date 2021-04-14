require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  
    before do
      @item_order = FactoryBot.build(:item_order)
    end
  
  describe '購入者情報の保存' do
    context '内容に問題ない場合' do
  
      it '全ての項目が入力されていれば購入ができる' do
        expect(@item_order).to be_valid
      end

      it '建物名がない場合も登録出来る' do
        @item_order.building = ""
        expect(@item_order).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'token(クレジットカード情報)が空だと購入ができない' do
        @item_order.token = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end
    
      it '郵便番号が空だと購入ができない' do
        @item_order.postcode = ""
        @item_order.valid?
        expect(@item_order.errors.messages).to include({:postcode => ["can't be blank", "is invalid"]})
      end

      it '郵便番号にハイフンがないと登録できない' do
        @item_order.postcode = "12345678"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postcode is invalid")
      end
      it '郵便番号が8桁でないと購入できない' do
        @item_order.postcode = "123-456"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postcode is invalid")
      end

      it 'area_idが空だと購入できない' do
        @item_order.area_id = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Area can't be blank")
      end
      it 'area_idが1だと購入できない' do
        @item_order.area_id = "1"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Area must be other than 1")
      end
      it 'cityが空だと購入できない' do
        @item_order.city = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと購入できない' do
        @item_order.block = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @item_order.phone_number = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it 'phone_numberが11桁でなければ購入できない' do
        @item_order.phone_number = "080123456789"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが英数混合では登録できないこと' do
       @item_order.phone_number = "123456789ab"
       @item_order.valid?
       expect(@item_order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'user_idが存在しないと登録できない' do
        @item_order.user_id = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが存在しないと登録できない' do
        @item_order.item_id = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
