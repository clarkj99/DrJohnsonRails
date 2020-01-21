class Api::V1::Icd10sController < ApplicationController
  before_action :find_icd10, only: [:show]

  def index
    if params[:term].length > 1
      @icd10s = Icd10.where("(lower(code) like ?) OR ((lower(code) like 'o%'  OR lower(code) like 'm%') AND lower(description) like ?)", "%#{params[:term].downcase}%", "%#{params[:term].downcase}%")
    else
      # @icd10s = Icd10.where("code like 'O%'  OR code like 'M%'").limit(10)
      @icd10s = []
    end
    render json: @icd10s, status: :ok
  end

  def show
    render json: @icd10, status: :ok
  end

  def find_icd10
    @icd10 = Icd10.find(params[:id])
  end
end

# (lower(code) like ?)
