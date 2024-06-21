require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_numericality_of(:year).only_integer }

  context 'with valid attributes' do
    it 'is valid with valid attributes' do
      vehicle = FactoryBot.build(:vehicle)
      expect(vehicle).to be_valid
    end
  end
end
