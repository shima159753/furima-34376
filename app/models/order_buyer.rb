class OrderBuyer
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :delivery_area_id, :city, :address, :building_name, :tel, :order_id
  
  #:user_id, :item_id,, :order_id,

  with_options presence: true do
    validates  :city, :address, :tel
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :delivery_area_id, numericality: {other_than: 0, message: "can't be blank"}
  # ここにバリデーションの処理を書く

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Buyer.create(postal_code: postal_code, delivery_area_id: delivery_area_id, city: city, address: address, building_name: building_name, tel: tel,order_id: order.id,item_id: item_id)
  end
end

# order_id: order.id,