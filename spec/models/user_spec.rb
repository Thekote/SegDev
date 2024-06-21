require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_one(:house) }
  it { is_expected.to have_one(:vehicle) }

  it { is_expected.to accept_nested_attributes_for(:house) }
  it { is_expected.to accept_nested_attributes_for(:vehicle) }

  it { is_expected.to validate_presence_of(:age) }
  it { is_expected.to validate_numericality_of(:age).is_greater_than(0) }

  it { is_expected.to validate_presence_of(:dependents) }
  it { is_expected.to validate_numericality_of(:dependents).is_greater_than_or_equal_to(0) }

  it { is_expected.to validate_presence_of(:income) }
  it { is_expected.to validate_numericality_of(:income).is_greater_than_or_equal_to(0) }

  it { is_expected.to validate_presence_of(:marital_status) }
  it { is_expected.to define_enum_for(:marital_status).with_values(single: "single", married: "married").backed_by_column_of_type(:string) }

  it { is_expected.to validate_presence_of(:risk_questions) }

  context 'with valid attributes' do
    it 'is valid with valid attributes' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    it 'creates associated house and vehicle' do
      user = create(:user)
      expect(user.house).to be_present
      expect(user.vehicle).to be_present
    end
  end
end
