require 'rails_helper'

RSpec.describe CalculateHomeScoreService, type: :service do
  let(:asset) { build(:asset) }

  describe '#calculate' do
    context 'when the house ownership status is rented' do
      it 'adds 1 to the score' do
        asset[:house][:ownership_status] = "rented"
        service = described_class.new(asset)

        expect(service.calculate).to eq(1) 
      end
    end

    context 'when the house ownership status is owned' do
      it 'does not add to the score' do
        service = described_class.new(asset)

        expect(service.calculate).to eq(0)
      end
    end

    context 'when there is no house' do
      it 'returns nil' do
        asset[:house] = {}
        service = described_class.new(asset)

        expect(service.calculate).to eq(nil) 
      end
    end
  end
end
