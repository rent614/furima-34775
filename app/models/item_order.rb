class ItemOrder
  include ActiveModel::Model
  attr_accessor :token, :postcode, :area_id, :city, :block, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :token
    validates :city
    validates :block
    validates :user_id
    validates :item_id
    validates :area_id, numericality: { other_than: 1 }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/ }  

  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, area_id: area_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end

end