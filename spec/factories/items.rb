FactoryBot.define do
  factory :item do
    name                       { 'test' }
    text                       { 'test' }
    category_id                { 2 }
    state_id                   { 2 }
    delivery_fee_id            { 2 }
    delivery_area_id           { 2 }
    delivery_days_id           { 2 }
    price                      { 555 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
