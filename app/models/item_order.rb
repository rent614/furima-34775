class ItemOrder
  include ActiveModel::Model
  attr_accessor :token, :postcode, :area_id, :city, :block, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :token
    validates :city
    validates :block
    validates :area_id, numericality: { other_than: 1 }
    validates :phone_number, format: { with: /\A\d{11}\z/ }

    with_options format: { with: /\A\d{3}[-]\d{4}\z/ } do
      validates :postcode
    end
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, area_id: area_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end

end