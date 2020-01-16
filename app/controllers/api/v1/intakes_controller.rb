class Api::V1::IntakesController < ApplicationController
  before_action :find_intake, only: [:show, :update]

  def show
    render json: @intake, status: :ok
  end

  def update
    if @intake.update(intake_params)
      render json: @intake, status: :ok
    else
      render json: { statusText: @intake.errors.full_messages[0] }, status: :unauthorized
    end
  end

  private

  def find_intake
    @intake = Intake.find(params[:id])
  end

  def intake_params
    params.require(:intake).permit(:complaint, :weight, :height, :bp_systolic, :bp_diastolic, :appointment_at, :checkin_at)
  end
end
