# frozen_string_literal: true

require 'rails_helper'

RSpec.describe House, type: :model do
  it { is_expected.to belong_to(:user) }

  it {
    is_expected.to define_enum_for(:ownership_status).with_values(owned: 'owned',
                                                                  rented: 'rented').backed_by_column_of_type(:string)
  }

  context 'with valid attributes' do
    it 'is valid with valid attributes' do
      house = FactoryBot.build(:house)
      expect(house).to be_valid
    end
  end
end
