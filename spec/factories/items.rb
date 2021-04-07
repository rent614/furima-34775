FactoryBot.define do
  factory :item do
    items_name            {Faker::Name.initials}
    description           {Faker::Lorem.sentence}
    category_id           {'2'}
    status_id             {'3'}
    delivery_fee_id       {'2'}
    area_id               {'3'}
    day_id                {'2'}
    price                 {'1000'}  
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
