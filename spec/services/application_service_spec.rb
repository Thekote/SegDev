require 'rails_helper'

RSpec.describe ApplicationService, type: :service do
  let(:asset) { build(:asset) }

  describe '#calculate_line_score' do
    context 'when age is less than 30' do
      it 'subtracts 2 from the score' do
        asset[:age] = 25
        service = described_class.new(asset)

        expect(service.calculate_line_score).to eq(-1)
      end
    end

    context 'when age is between 30 and 40' do
      it 'subtracts 1 from the score' do
        asset[:age] = 35
        service = described_class.new(asset)

        expect(service.calculate_line_score).to eq(0)
      end
    end

    context 'when age is greater than or equal to 40' do
      it 'does not subtract from the score' do
        asset[:age] = 40
        service = described_class.new(asset)

        expect(service.calculate_line_score).to eq(1) 
      end
    end

    context 'when income is greater than 200000' do
      it 'subtracts 1 from the score' do
        asset[:income] = 250000
        service = described_class.new(asset)

        expect(service.calculate_line_score).to eq(-1)
      end
    end

    context 'when income is less than or equal to 200000' do
      it 'does not subtract from the score' do
        asset[:income] = 200000
        service = described_class.new(asset)
        
        expect(service.calculate_line_score).to eq(0)
      end
    end
  end
end
