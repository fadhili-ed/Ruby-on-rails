# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Send, type: :model do
  it 'should have valid Factory' do
    expect(FactoryBot.create(:user)).to be_valid
  end

  describe '#sends table column' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :sender_phone_number }
    it { is_expected.to have_db_column :recepient_phone_number }
    it { is_expected.to have_db_column :sender_id_number }
    it { is_expected.to have_db_column :amount }
    it { is_expected.to have_db_column :pin }
  end

  describe 'Send validations' do
    it { is_expected.to validate_presence_of(:sender_id_number) }
    it { is_expected.to validate_presence_of(:recepient_phone_number) }
    it { is_expected.to validate_presence_of(:sender_phone_number) }
    it { is_expected.to validate_length_of(:sender_phone_number) }
    it { is_expected.to validate_length_of(:recepient_phone_number) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:pin) }
    it { is_expected.to validate_length_of(:sender_id_number) }
    it { is_expected.to validate_numericality_of(:amount) }
    it { is_expected.to validate_numericality_of(:pin) }
    it { is_expected.to validate_numericality_of(:sender_id_number) }
    it 'ensures sender phone number and recepirnt phone numbers are not equal' do
      expect(:sender_phone_number).to_not eq :recepient_phone_number
    end
  end

  it 'ensures db is safe  and attributes are not null' do
    valid_send_attrs = { pin: 1234, amount: '500', sender_id_number: 234_587, sender_phone_number: '0702564851', recepient_phone_number: '0745896239' }
    send_without_amount_attr = valid_send_attrs.slice(:sender_id_number, :sender_phone_number, :recepient_phone_number, :pin)
    send_without_amount = Send.new(send_without_amount_attr)
    expect { send_without_amount.save!(validate: false) }.to raise_error(ActiveRecord::NotNullViolation)
    send_without_pin_attr = valid_send_attrs.slice(:sender_id_number, :sender_phone_number, :recepient_phone_number, :amount)
    send_without_pin = Send.new(send_without_pin_attr)
    expect { send_without_pin.save!(validate: false) }.to raise_error(ActiveRecord::NotNullViolation)
    send_without_sender_phone_number_attr = valid_send_attrs.slice(:sender_id_number, :pin, :recepient_phone_number, :amount)
    send_without_sender_phone_number = Send.new(send_without_sender_phone_number_attr)
    expect { send_without_sender_phone_number.save!(validate: false) }.to raise_error(ActiveRecord::NotNullViolation)
    send_without_recepient_phone_number_attr = valid_send_attrs.slice(:sender_id_number, :sender_phone_number, :pin, :amount)
    send_without_recepient_phone_number = Send.new(send_without_recepient_phone_number_attr)
    expect { send_without_recepient_phone_number.save!(validate: false) }.to raise_error(ActiveRecord::NotNullViolation)
  end

  describe '#sending money' do
    it 'ensures sending has valid attributes' do
      sends = FactoryBot.create(:send)
      expect(sends.pin).to eq '1234'
      expect(sends.sender_phone_number).to eq '0702564851'
      expect(sends.recepient_phone_number).to eq '0745896239'
      expect(sends.sender_id_number).to eq '234587'
      expect(sends.amount).to eq '500'
    end

    it 'only allows id_number that are digits' do
      sends = FactoryBot.build(:send, sender_id_number: 'abc56890')
      sends.save
      expect(sends).to_not be_valid
      expect(sends.errors.messages[:sender_id_number]).to eq ['is not a number']
    end
  end
end
