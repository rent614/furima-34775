require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '購入者情報の保存' do
    before do
      @item_order = FactoryBot.build(:item_order)
    end
  
    it '全ての項目が入力されていれば購入ができる' do
      expect(@item_order).to be_valid
    end

    it 'token(クレジットカード情報)が空だと購入ができない' do
      @item_order.token = nil
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
      @item_order.area_id = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Area can't be blank")
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
    it 'user_idが存在しないと登録できない' do
      @item_order.user.id = ""
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("User id is invalid")
    end
    it 'item_idが存在しないと登録できない' do
      @item_order.item.id = ""
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Item id is invalid")
    end
  end
  end
