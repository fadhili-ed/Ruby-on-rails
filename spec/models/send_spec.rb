require 'rails_helper'

RSpec.describe Send, type: :model do
  describe "#sends table column" do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :sender_phone_number }
    it { is_expected.to have_db_column :recepient_phone_number }
    it { is_expected.to have_db_column :sender_id_number }
    it { is_expected.to have_db_column :amount }
    it { is_expected.to have_db_column :pin }
  end

  describe "Send validations" do
    it { is_expected.to validate_presence_of(:sender_id_number)}
    it { is_expected.to validate_presence_of(:recepient_phone_number)}
    it { is_expected.to validate_presence_of(:sender_phone_number)}
    it { is_expected.to validate_presence_of(:amount)}
    it { is_expected.to validate_presence_of(:pin)}
    it { is_expected.to validate_length_of(:sender_id_number)}
    it { is_expected.to validate_numericality_of(:amount)}
    it { is_expected.to validate_numericality_of(:pin)}
    it { is_expected.to validate_numericality_of(:sender_id_number)}
  end
end
