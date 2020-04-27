class User < ApplicationRecord
    
    validates :first_name, presence: true, length: { maximum: 30} 
    validates :last_name, presence: true, length: { maximum: 30}
    validates :phone_number, presence: true, length: {minimum: 10, maximum: 13}, 
                numericality: { only_integer: true} 
    validates :id_number, presence: true, length: {minimum: 7, maximum: 9}
    validates :password, presence: true, length: {minimum: 8}, format: { with: /\A[a-zA-Z]+\z/,
        message: "Should be letters only" }
    validates :pin, length: { is: 4}, numericality: { only_integer: true}
    has_secure_password
end
