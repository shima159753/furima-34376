class Order < ApplicationRecord
  has_one :buyer, dependent: :destroy
  belongs_to :item
  belongs_to :user
end
