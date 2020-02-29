class Api::V1::PhotosController < ApplicationController
  before_action :find_profile

  def show
    render json: @profile, status: :ok
  end

  def update

    # Handle either a file upload, image, or a link
    if params[:file]
      @profile.avatar.attach(params[:file])
      photo = url_for(@profile.avatar)
    elsif params[:camera]
      blob = ActiveStorage::Blob.create_after_upload!(
        io: StringIO.new((Base64.decode64(params[:camera].split(",")[1]))),
        filename: "user.png",
        content_type: "image/png",
      )
      @profile.avatar.attach(blob)
      photo = url_for(@profile.avatar)
    else
      photo = photo_params[:photo]
    end
    puts photo
    if @profile.update(photo: photo)
      render json: @profile, status: :ok
    end
  end

  private

  def find_profile
    @profile = Profile.find(params[:id])
  end

  def photo_params
    params.permit(:photo, :file, :filename, :type)
  end
end
