class Item < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_one :purchase_history
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :description
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :area
  belongs_to_active_hash :day
  belongs_to_active_hash :price

  with_options presence: true do
    validates :items_name
    validates :description
    validates :image

    with_options numericality: { other_than: 1 } do
      validates :category
      validates :description
      validates :delivery_fee
      validates :area
      validates :day
    end

    with_options format: { with: /\A[0-9]+\z/ } do
      validates :price, numericality: { greater_than: 300, less_than: 9999999 } 
    end
  end
end

