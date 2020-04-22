class Deposit < ApplicationRecord
    validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
        message: "Should be letters only" }
    validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
        message: "Should be letters only" }
    validates :deposits, presence: true, format: {with: /\d+/, message: "should be digits only"}
end
