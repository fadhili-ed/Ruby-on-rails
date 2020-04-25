class Deposit < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true 
    validates :deposits, presence: true, numericality: { only_integer: true}
end
