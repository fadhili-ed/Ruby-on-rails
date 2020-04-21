require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#user table column' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :first_name }
    it { is_expected.to have_db_column :last_name }
    it { is_expected.to have_db_column :phone_number }
    it { is_expected.to have_db_column :pin }
    it { is_expected.to have_db_column :id_number }
    it { is_expected.to have_db_column :balance}   
  end
end
