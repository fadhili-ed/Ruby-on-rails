class Send < ApplicationRecord
    validates :sender_phone_number, presence: true
    validates :recepient_phone_number, presence: true
    validates :pin, presence: true, numericality: {only_integer: true}
    validates :amount, presence: true, numericality: {only_integer: true}
    validates :sender_id_number, presence: true, length: {maximum: 9, minimum: 5},
                numericality: { only_integer: true}
end
