class Order < ApplicationRecord
  has_one :buyer
  belongs_to :item
  belongs_to :user
  
end
