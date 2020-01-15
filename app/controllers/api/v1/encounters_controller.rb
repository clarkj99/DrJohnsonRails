class Api::V1::EncountersController < ApplicationController
  # skip_before_action :authorized, only: [:index]

  before_action :find_encounter, only: [:show, :destroy, :update]

  def index
    @encounters = Encounter.all
    render json: @encounters.to_json(:include => { :patient => { :include => { :profile => {} } }, :hpi => {}, :rosystem => {}, :problem_exam => {} }), status: :ok
  end

  def show
    render json: @encounter.to_json(:include => { :patient => { :include => { :profile => {} } }, :hpi => {}, :rosystem => {}, :problem_exam => {} }), status: :ok
  end

  def create
    @encounter = Encounter.new(encounter_params)

    if @encounter.valid?
      @encounter.save
      redirect_to encounters_path
    else
      render :new
    end
  end

  def update
    if @encounter.update(encounter_params)
      render json: @encounter.to_json(:include => { :patient => { :include => { :profile => {} } }, :hpi => {}, :rosystem => {}, :problem_exam => {} }), status: :ok
    end
  end

  def destroy
    @encounter.destroy
  end

  def find_encounter
    @encounter = Encounter.find(params[:id].to_i)
  end

  def encounter_params
    params.require(:encounter).permit()
  end
end
