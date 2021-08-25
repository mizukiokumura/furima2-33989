class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :days_to_ship
  belongs_to :shipment_source_prefecture
  belongs_to :delivery_fee_burden

  with_options presence: true do
    validates :name
    validates :item_description
    validates :image
    with_options numericality: { other_than: 0, message: "can't be blank"} do
      validates :category_id
      validates :state_id
      validates :delivery_fee_burden_id
      validates :days_to_ship_id
      validates :shipment_source_prefecture_id
    end
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
  end
end
