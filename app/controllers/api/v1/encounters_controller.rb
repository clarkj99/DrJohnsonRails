class Api::V1::EncountersController < ApplicationController
  skip_before_action :authorized, only: [:index]

  before_action :find_encounter, only: [:show, :edit, :destroy, :update]

  def index
    @encounters = Encounter.all
    render json: @encounters.to_json(:include => [:patient]), status: :ok
  end

  def show
  end

  def new
    @encounter = Encounter.new
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

  def edit
  end

  def update
    if @encounter.update(encounter_params)
      redirect_to encounter_path(@encounter)
    else
      render :edit
    end
  end

  def destroy
    @encounter.destroy
  end

  def find_encounter
    @encounter = Encounter.find(params[:id])
  end

  def encounter_params
    params.require(:encounter).permit()
  end
end
