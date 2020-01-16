class Api::V1::DiagnosesController < ApplicationController
  before_action :find_diagnosis, only: [:show, :update]

  def show
    render json: @diagnosis, status: :ok
  end

  def update
    if @diagnosis.update(diagnosis_params)
      render json: @diagnosis, status: :ok
    else
      render json: { statusText: @diagnosis.errors.full_messages[0] }, status: :unauthorized
    end
  end

  private

  def find_diagnosis
    @diagnosis = Diagnosis.find(params[:id])
  end

  def diagnosis_params
    params.require(:diagnosis).permit(:duration, :duration_units, :location, :context, :aggravating_factors, :severity)
  end
end
