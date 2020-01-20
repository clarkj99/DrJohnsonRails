class Api::V1::HistoriesController < ApplicationController
  before_action :find_history, only: [:show, :update]

  def update
    if @history.update(history_params)
      render json: @history, status: :ok
    else
      render json: { statusText: @history.errors.full_messages[0] }, status: :unauthorized
    end
  end

  private

  def find_history
    @history = History.find(params[:id])
  end

  def history_params
    params.require(:history).permit(:pregnancy, :hypertension, :high_bp, :cancer, :breast_lump, :heart_disease, :abnormal_ekg, :depression, :diabetes1, :diabetes2, :infertility, :mental_illness, :post_menopausal_bleeding, :seizures, :migraines)
  end
end
