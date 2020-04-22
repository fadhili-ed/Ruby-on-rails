require 'rails_helper'

RSpec.describe Deposit, type: :model do
  describe '#user table column' do
    it { is_expected.to have_db_column :first_name }
    it { is_expected.to have_db_column :last_name }
    it { is_expected.to have_db_column :deposits}
  end

  describe "#validate attributes" do
    it { is_expected.to validate_presence_of(:first_name)}
    it { is_expected.to validate_presence_of(:last_name)}
    it { is_expected.to validate_presence_of(:deposits)}
    it "ensures first name is letters only" do
      expect(:first_name).to match(/\A[a-zA-Z]+\z/)
    end
    it "ensures deposits is digits only" do
      expect(:deposits).to match(/\d+/)
    end

    it "raises database error when user attributes are null" do
      valid_user_attrs = { first_name: "Jane", last_name: "Doe", deposits: "123456"}
      user_without_first_name_attr =   valid_user_attrs.slice(:last_name,:deposits)
      user_without_first_name = Deposit.new(user_without_first_name_attr)
      expect { user_without_first_name.save!(validate: false)}.to raise_error(ActiveRecord::NotNullViolation)
      user_without_last_name_attr =   valid_user_attrs.slice(:first_name,:deposits)
      user_without_last_name = Deposit.new(user_without_last_name_attr)
      expect { user_without_last_name.save!(validate: false)}.to raise_error(ActiveRecord::NotNullViolation)
    end
  end
end
