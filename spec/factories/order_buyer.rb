FactoryBot.define do
  factory :order_buyer do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {"123-4567"}
    delivery_area_id { 2 }
    city { "横浜市緑区" }
    address { "青山1-1-1" }
    building_name { "柳ビル103" }
    tel { "09012345678" }
  end
end