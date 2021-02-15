class OrderBuyer
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :delivery_area_id, :city, :address, :building_name, :tel, :order_id, :token

  with_options presence: true do
    validates  :city, :address, :user_id, :item_id, :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'は無効です。ハイフン（-）を含めて下さい' }
    validates :tel, format: { with: /\A\d{10,11}\z/, message: 'は無効です。10桁もしくは11桁で入力して下さい' }
  end
  validates :delivery_area_id, numericality: { other_than: 0, message: "を入力して下さい" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Buyer.create(postal_code: postal_code, delivery_area_id: delivery_area_id, city: city, address: address,
                 building_name: building_name, tel: tel, order_id: order.id)
  end
end
