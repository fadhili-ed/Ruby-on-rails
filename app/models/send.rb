class Send < ApplicationRecord
    validates :sender_phone_number, presence: true
    validates :recepient_phone_number, presence: true
    validates :pin, presence: true
    validates :amount, presence: true
    validates :sender_id_number, presence: true
end
