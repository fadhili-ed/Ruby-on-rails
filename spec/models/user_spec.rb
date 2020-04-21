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
  describe '#validation of user attributes' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:id_number) }
    it { is_expected.to validate_presence_of(:phone_number) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:pin)}
    it { is_expected.to validate_numericality_of(:pin)}
    # it { is_expected.to validate_uniqueness_of(:phone_number)}
    # it { is_expected.to validate_uniqueness_of(:id_number)}
    it { is_expected.to validate_length_of(:first_name)}
    it { is_expected.to validate_length_of(:last_name)}
    it { is_expected.to validate_length_of(:password)}
    it { is_expected.to validate_length_of(:id_number)}
    it { is_expected.to validate_length_of(:phone_number)}
    it { is_expected.to validate_numericality_of(:phone_number)}
    it "raise database error when user attributes are null" do
      valid_user_attrs = { first_name: "Jane", last_name: "Doe", id_number: 1234567, phone_number: "0700000000", pin: 1234, password: "PassWord@123."}
      user_without_first_name_attr =   valid_user_attrs.slice(:last_name,:id_number,:phone_number, :pin, :password)
      user_without_first_name = User.new(user_without_first_name_attr)
      expect { user_without_first_name.save!(validate: false)}.to raise_error(ActiveRecord::NotNullViolation)
      user_without_last_name_attr =   valid_user_attrs.slice(:first_name,:id_number,:phone_number, :pin, :password)
      user_without_last_name = User.new(user_without_last_name_attr)
      expect { user_without_last_name.save!(validate: false)}.to raise_error(ActiveRecord::NotNullViolation)
    end
  end
  
end
