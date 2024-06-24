class Api::V1::InsurancesCalculatorController < Api::BaseController
  def calculate_final_scores
    asset = permitted_params
    insurance_profile = GenerateInsurancePlansService.new(asset).generate_scores

    render json: insurance_profile, status: :ok
  end

  private

  def permitted_params
    if params[:insurances_calculator].present?
      params.require(:insurances_calculator).permit(
        :age, 
        :income, 
        :dependents, 
        :marital_status, 
        risk_questions: [],
        house: [:ownership_status],
        vehicle: [:year]
      )
    else
      params.permit(
        :age, 
        :income, 
        :dependents, 
        :marital_status, 
        risk_questions: [],
        house: [:ownership_status],
        vehicle: [:year]
      )
    end
  end
end
