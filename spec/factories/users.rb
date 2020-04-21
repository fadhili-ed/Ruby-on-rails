FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name { "Doe" }
    id_number { "12345678" }
    phone_number { "070000000000" }
    password { "VeryStrong.123#" }
    # password_confirmation{"VeryStrong.123#"}
    balance { 0.0 }
  end
end
