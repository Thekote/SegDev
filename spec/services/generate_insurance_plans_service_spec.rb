require 'rails_helper'

RSpec.describe GenerateInsurancePlansService do
  let(:asset) { build(:asset) }

  subject { described_class.new(asset) }

  describe '#generate_scores' do
    context 'when all scores are calculated' do
      before do
        allow_any_instance_of(CalculateAutoScoreService).to receive(:calculate).and_return(3)
        allow_any_instance_of(CalculateLifeScoreService).to receive(:calculate).and_return(1)
        allow_any_instance_of(CalculateHomeScoreService).to receive(:calculate).and_return(0)
        allow_any_instance_of(CalculateDisabilityScoreService).to receive(:calculate).and_return(nil)
      end

      it 'returns the correct insurance profile' do
        result = subject.generate_scores
        expect(result).to eq({
          auto: 'avancado',
          disability: 'inelegivel',
          home: 'economico',
          life: 'padrao'
        })
      end
    end

    context 'when house ownership status is empty' do
      before do
        allow_any_instance_of(CalculateAutoScoreService).to receive(:calculate).and_return(2)
        allow_any_instance_of(CalculateLifeScoreService).to receive(:calculate).and_return(0)
        allow_any_instance_of(CalculateHomeScoreService).to receive(:calculate).and_return(nil)
        allow_any_instance_of(CalculateDisabilityScoreService).to receive(:calculate).and_return(1)
      end

      it 'returns the correct insurance profile with home as ineligible' do
        asset[:house] = {}

        result = subject.generate_scores
        expect(result).to eq({
          auto: 'padrao',
          disability: 'padrao',
          home: 'inelegivel',
          life: 'economico'
        })
      end
    end
  end
end
