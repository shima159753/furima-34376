class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :delivery_area
  belongs_to :delivery_days

  belongs_to :user
  has_one_attached :image

  validates :name, :text, :price, :image, presence: true

  validates :category_id, :state_id, :delivery_fee_id, :delivery_area_id, :delivery_days_id, numericality: { other_than: 0 }

  validates_inclusion_of :price, in: 300..9_999_999
end
