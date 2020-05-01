# frozen_string_literal: true

FactoryBot.define do
  factory :withdraw do
    pin { '1234' }
    amount { '0' }
    id_number { '12345678' }
  end
end
