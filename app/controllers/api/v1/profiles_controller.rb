class Api::V1::ProfilesController < ApplicationController
  def show
    render json: current_user.to_json(:include => [:profile]), status: :ok
  end

  def update
    if current_user.profile.update(profile_params)
      render json: current_user.to_json(:include => [:profile]), status: :ok
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:address1, :address2, :city, :state, :zip)
  end
end
