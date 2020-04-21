FactoryBot.define do
  factory :user do
    first_name { "MyString" }
    last_name { "MyString" }
    id_number { "MyString" }
    phone_number { "MyString" }
    pin { "MyString" }
    balance { 1.5 }
    password { "MyString" }
  end
end
