FactoryBot.define do
  factory :item_order do
    token          {'tok_abcdefghijk00000000000000000'}
    postcode      {'123-4567'}
    area_id        {3}
    city           {'横浜市'}
    block          {'1-1-1'}
    building       {'建物ビル'}
    phone_number   {'09022223333'} 
  end
end
