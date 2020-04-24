FactoryBot.define do
  factory :send do
    sender_phone_number { "MyString" }
    recepient_phone_number { "MyString" }
    sender_id_number { "MyString" }
    amount { "MyString" }
    pin { "MyString" }
  end
end
