require 'rails_helper'

RSpec.describe Withdraw, type: :model do
  it 'should have valid Factory' do
    expect(FactoryBot.create(:user)).to be_valid
  end
  
  describe '#withdrwal table column' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :pin }
    it { is_expected.to have_db_column :amount }
    it { is_expected.to have_db_column :id_number }
  end
  describe "withdrawal validations" do
    it { is_expected.to validate_presence_of(:pin)}
    it { is_expected.to validate_presence_of(:amount)}
    it { is_expected.to validate_presence_of(:id_number)}
    it { is_expected.to validate_length_of(:id_number)}
    it { is_expected.to validate_numericality_of(:id_number)}
    it { is_expected.to validate_numericality_of(:amount)}
    it { is_expected.to validate_numericality_of(:pin)}
    it { is_expected.to validate_length_of(:pin)}
  end

  it "ensure database is safe" do
    valid_withdrawal_attrs = { pin:1234, amount:'500', id_number: 234587}
    withdrawal_without_amount_attr =   valid_withdrawal_attrs.slice(:id_number, :pin)
    withdrawal_without_amount = Withdraw.new(withdrawal_without_amount_attr)
    expect { withdrawal_without_amount.save!(validate: false)}.to raise_error(ActiveRecord::NotNullViolation)
    withdrawal_without_pin_attr =   valid_withdrawal_attrs.slice(:id_number, :amount)
    withdrawal_without_pin = Withdraw.new(withdrawal_without_pin_attr)
    expect { withdrawal_without_pin.save!(validate: false)}.to raise_error(ActiveRecord::NotNullViolation)
  end

  describe "making withdrawal" do
    it "ensures withdrawal has valid attributes" do
      withdrawal=FactoryBot.create(:withdraw)
      expect(withdrawal.pin).to eq "1234"
      expect(withdrawal.amount).to eq "0"
      expect(withdrawal.id_number).to eq "12345678"
    end

    it "only allows id_numbers that are digits" do
      withdrawal = FactoryBot.build(:withdraw, id_number: "abc12679") 
      withdrawal.save    
      expect(withdrawal).to_not be_valid 
      expect(withdrawal.errors.messages[:id_number]).to eq ["is not a number"] 
    end
  end
end
