require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should have valid Factory' do
    expect(FactoryBot.create(:user)).to be_valid
  end

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
  describe "#creating user" do
    it 'creates user with valid attributes' do
      user = FactoryBot.create(:user)
      expect(user.first_name).to eq 'John' 
      expect(user.balance).to eq 0.0 
      expect(user.pin).to eq "1234" 
    end
    # it "do not allow existing phone number" do
    #   FactoryBot.create(:user) 
    #   user = FactoryBot.build(:user, phone_number:  "070000000000", id_number: "0000000")
    #   user.save 
    #   expect(user).not_to be_valid 
    #   expect(user.errors.messages[:phone_number]).to eq ["has already been taken"] 
    # end
    it "do not allow phone number that are less than 10" do
      user = FactoryBot.build(:user, phone_number: "12345678")
      user.save        
      expect(user.errors.messages[:phone_number]).to eq ["is too short (minimum is 10 characters)"]
    end
    it "do not allow phone number that is greater than 13" do
      user = FactoryBot.build(:user, phone_number: "12345678910112221")
      user.save
      expect(user.errors.messages[:phone_number]).to eq ["is too long (maximum is 13 characters)"]
    end
    it "do not allow id_number that are less than 7" do
      user = FactoryBot.build(:user, id_number: "123456")
      user.save
      expect(user.errors.messages[:id_number]).to eq ["is too short (minimum is 7 characters)"]
    end
    it "do not allow id_number that are more than 9" do
      user = FactoryBot.build(:user, id_number: "123456789101")
      user.save
      expect(user.errors.messages[:id_number]).to eq ["is too long (maximum is 9 characters)"]
    end
    it "do not allow passwords that are less than 8 characters" do
      user = FactoryBot.build(:user, password: "2301you")
      user.save
      expect(user.errors.messages[:password]).to eq ["is too short (minimum is 8 characters)"]
    end
    
  end
end