class Api::V1::PhotosController < ApplicationController
  before_action :find_profile

  def show
    render json: @profile, status: :ok
  end

  def update
    if params[:camera]
      # blob = ActiveStorage::Blob.create_after_upload!(
      #   io: StringIO.new((params[:camera])),
      #   filename: params[:filename],
      #   content_type: params[:type],
      # )
      @profile.avatar.attach(params[:camera])
      if @profile.update(photo: url_for(@profile.avatar))
        render json: @profile, status: :ok
      end
    else
      if @profile.update(photo: photo_params[:photo])
        render json: @profile, status: :ok
      end
    end
  end

  private

  def find_profile
    @profile = Profile.find(params[:id])
  end

  def photo_params
    params.permit(:photo, :camera, :filename, :type)
  end
end
