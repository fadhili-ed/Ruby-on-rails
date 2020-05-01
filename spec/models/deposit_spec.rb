# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Deposit, type: :model do
  it 'should have valid Factory' do
    expect(FactoryBot.create(:deposit)).to be_valid
  end

  describe '#user table column' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :first_name }
    it { is_expected.to have_db_column :last_name }
    it { is_expected.to have_db_column :deposits }
  end

  describe '#validate attributes' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:deposits) }
    it { is_expected.to validate_numericality_of(:deposits) }

    it 'raises database error when user attributes are null' do
      valid_user_attrs = { first_name: 'Jane', last_name: 'Doe', deposits: '123456' }
      user_without_first_name_attr =   valid_user_attrs.slice(:last_name, :deposits)
      user_without_first_name = Deposit.new(user_without_first_name_attr)
      expect { user_without_first_name.save!(validate: false) }.to raise_error(ActiveRecord::NotNullViolation)
      user_without_last_name_attr = valid_user_attrs.slice(:first_name, :deposits)
      user_without_last_name = Deposit.new(user_without_last_name_attr)
      expect { user_without_last_name.save!(validate: false) }.to raise_error(ActiveRecord::NotNullViolation)
    end
  end

  describe '#creating a deposit' do
    it 'creates a valid deposit' do
      deposit = FactoryBot.create(:deposit)
      expect(deposit.first_name).to eq 'Luke'
      expect(deposit.last_name).to eq 'Loot'
      expect(deposit.deposits).to eq '123456'
    end

    it 'requires deposits to be in digits' do
      deposit = FactoryBot.build(:deposit, deposits: 'abcdef')
      deposit.save
      expect(deposit.errors.messages[:deposits]).to eq ['is not a number']
    end
  end
end
