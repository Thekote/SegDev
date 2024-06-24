require 'rails_helper'

RSpec.describe CalculateLifeScoreService, type: :service do
  let(:asset) { build(:asset) }

  describe '#calculate' do
    context 'when there is more than zero dependents' do
      it 'adds 1 to the score' do
        service = described_class.new(asset)

        expect(service.calculate).to eq(2)
      end
    end

    context 'when there is no dependents' do
      it 'adds 1 to the score' do
        asset[:dependents] = 0
        service = described_class.new(asset)

        expect(service.calculate).to eq(1)
      end
    end

    context 'when marital status is married' do
      it 'adds 1 to the score' do
        service = described_class.new(asset)

        expect(service.calculate).to eq(2) 
      end
    end

    context 'when marital status is single' do
      it 'does not add 1 to the score' do
        asset[:marital_status] = "single"
        service = described_class.new(asset)

        expect(service.calculate).to eq(1) 
      end
    end

    context 'when age is above 60' do
      it 'returns nil' do
        asset[:age] = 61
        service = described_class.new(asset)

        expect(service.calculate).to eq(nil) 
      end
    end
  end
end
