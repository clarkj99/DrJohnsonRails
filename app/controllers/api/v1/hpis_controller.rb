class Api::V1::HpisController < ApplicationController
  before_action :find_hpi, only: [:show, :update]

  def show
    render json: @hpi, status: :ok
  end

  def update
    if @hpi.update(hpi_params)
      render json: @hpi, status: :ok
    else
      render json: { statusText: @hpi.errors.full_messages[0] }, status: :unauthorized
    end
  end

  private

  def find_hpi
    @hpi = Hpi.find(params[:id])
  end

  def hpi_params
    params.require(:hpi).permit(:duration, :duration_units, :location, :context, :aggravating_factors, :severity)
  end
end
