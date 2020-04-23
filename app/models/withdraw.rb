class Withdraw < ApplicationRecord
    validates :id_number, length: { maximum: 9 }, presence: true, numericality:{ only_integer: true}
    validates :pin, presence: true, numericality: { only_integer: true}
    validates :amount, presence: true, numericality: { only_integer: true}
    
end
