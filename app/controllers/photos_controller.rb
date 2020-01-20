class Api::V1::PhotosController < ApplicationController
  before_action :find_profile

  def show
    render json: @profile, status: :ok
  end

  def update
    if @profile.update(photo: photo_params[:photo])
      render json: @profile, status: :ok
    end
  end

  private

  def find_profile
    @profile = Profile.find(params[:id])
  end

  def photo_params
    params.permit(:id, :photo)
  end
end
