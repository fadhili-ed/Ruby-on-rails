FactoryBot.define do
  factory :send do
    sender_phone_number { "0702564851" }
    recepient_phone_number { "0745896239" }
    sender_id_number { "234587" }
    amount { "500" }
    pin { "1234" }
  end
end
