require 'rails_helper'

RSpec.describe CalculateAutoScoreService, type: :service do
  let(:asset) { build(:asset) }

  describe '#calculate' do
    context 'when vehicle year is within the limit' do
      it 'adds 1 to the score' do
        asset[:vehicle][:year] = 2021
        service = described_class.new(asset)

        expect(service.calculate).to eq(1) 
      end
    end

    context 'when vehicle year is outside the limit' do
      it 'does not add to the score' do
        asset[:vehicle][:year] = 2016
        service = described_class.new(asset)

        expect(service.calculate).to eq(0)
      end
    end

    context 'when vehicle is not present' do
      it 'returns nil' do
        asset[:vehicle] = {}
        service = described_class.new(asset)

        expect(service.calculate).to eq(nil)
      end
    end
  end
end
