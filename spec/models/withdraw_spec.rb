require 'rails_helper'

RSpec.describe Withdraw, type: :model do
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
  end

end
