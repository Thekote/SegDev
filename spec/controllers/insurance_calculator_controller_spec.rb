# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::InsurancesCalculatorController, type: :controller do
  describe 'POST #calculate_final_scores' do
    let(:valid_params) { build(:asset) }

    let(:insurance_profile) do
      {
        auto: 'economico',
        disability: 'economico',
        home: 'economico',
        life: 'padrao'
      }
    end

    before do
      allow(GenerateInsurancePlansService).to receive(:new).and_return(double(generate_scores: insurance_profile))
    end

    context 'with valid parameters' do
      before do
        post :calculate_final_scores, params: valid_params
      end

      it 'calls the GenerateInsurancePlansService' do
        expect(GenerateInsurancePlansService).to have_received(:new)
      end

      it 'returns the correct insurance profile' do
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(JSON.parse(response.body)).to eq(insurance_profile.stringify_keys)
      end
    end

    context 'with parameters under insurances_calculator key' do
      let(:params_with_key) { { insurances_calculator: valid_params } }

      before do
        post :calculate_final_scores, params: params_with_key
      end

      it 'calls the GenerateInsurancePlansService' do
        expect(GenerateInsurancePlansService).to have_received(:new)
      end

      it 'returns the correct insurance profile' do
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(JSON.parse(response.body)).to eq(insurance_profile.stringify_keys)
      end
    end
  end
end
