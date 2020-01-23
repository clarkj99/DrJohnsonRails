class Api::V1::EncountersController < ApplicationController
  # skip_before_action :authorized, only: [:index]

  before_action :find_encounter, only: [:show, :destroy, :update]

  def index
    @encounters = Encounter.all
    render json: @encounters.to_json(:include => { :patient => { :include => { :profile => {}, :history => {} } }, :provider => {}, :intake => {}, :hpi => {}, :rosystem => {}, :problem_exam => {}, :diagnosis => {} }), status: :ok
  end

  def show
    render json: @encounter.to_json(:include => { :patient => { :include => { :profile => {}, :history => {} } }, :provider => {}, :intake => {}, :hpi => {}, :rosystem => {}, :problem_exam => {}, :diagnosis => {} }), status: :ok
  end

  def create
    @encounter = Encounter.create(encounter_params)

    if @encounter.valid?
      @encounter.create_intake
      @encounter.create_hpi
      @encounter.create_rosystem
      @encounter.create_problem_exam
      @encounter.create_diagnosis
      render json: @encounter.to_json(:include => { :patient => { :include => { :profile => {} } }, :provider => {}, :intake => {}, :hpi => {}, :rosystem => {}, :problem_exam => {}, :diagnosis => {} }), status: :ok
    else
      render json: { error: @encounter.errors.full_messages[0] }, status: :bad_request
    end
  end

  def update
    if @encounter.update(encounter_params)
      render json: @encounter.to_json(:include => { :patient => { :include => { :profile => {} } }, :provider => {}, :intake => {}, :hpi => {}, :rosystem => {}, :problem_exam => {}, :diagnosis => {} }), status: :ok
    else
      render json: { statusText: @encounter.errors.full_messages[0] }, status: :bad_request
    end
  end

  def destroy
    @encounter.destroy
    render json: @encounter.to_json(:include => { :patient => { :include => { :profile => {} } }, :provider => {}, :intake => {}, :hpi => {}, :rosystem => {}, :problem_exam => {}, :diagnosis => {} }), status: :ok
  end

  def find_encounter
    @encounter = Encounter.find(params[:id].to_i)
  end

  def encounter_params
    params.require(:encounter).permit(:patient_id, :provider_id, :status)
  end
end
