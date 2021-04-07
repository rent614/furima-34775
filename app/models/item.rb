class Item < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_one :purchase_history
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :area
  belongs_to_active_hash :day
 

  with_options presence: true do
    validates :items_name
    validates :description
    validates :image

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :delivery_fee_id
      validates :area_id
      validates :day_id
    end

    with_options format: { with: /\A[0-9]+\z/ } do
      validates :price, numericality: { greater_than: 300, less_than: 9999999 } 
    end
  end
end
