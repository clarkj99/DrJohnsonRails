class Api::V1::RosystemsController < ApplicationController
  before_action :find_rosystem, only: [:show, :update]

  def show
    render json: @rosystem, status: :ok
  end

  def update
    if @rosystem.update(rosystem_params)
      render json: @rosystem, status: :ok
    else
      render json: { statusText: @rosystem.errors.full_messages[0] }, status: :unauthorized
    end
  end

  private

  def find_rosystem
    @rosystem = rosystem.find(params[:id])
  end

  def rosystem_params
    params.require(:rosystem).permit(:fever, :fatigue, :appetite, :weight, :constitutional_details, :depression, :anxiety, :psychiatric_details, :trouble_swallowing, :heartburn, :nausea, :vomiting, :irregular_bm, :gastrointestinal_details, :trouble_urinating, :abnormal_bleeding, :vaginal_discharge, :joint_pain, :joint_swelling, :musculoskeletal_details)
  end
end
