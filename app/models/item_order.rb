class ItemOrder
  include ActiveModel::Model
  attr_accessor :postcode, :area, :city, :block, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :city, :block
    validates :area, numericality: { other_than: 1 }
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    
    with_options format: { with: /\A\d{3}[-]\d{4}\z/ } do
      validates :postcode, length: { is: 8 } 
    end
  end
  
end