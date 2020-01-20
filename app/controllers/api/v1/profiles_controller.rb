class Api::V1::ProfilesController < ApplicationController
  def show
    render json: current_user.to_json(:include => [:profile, :history]), status: :ok
  end

  def update
    @user = User.find(params[:profile][:user_id])
    if @user.profile.update(profile_params)
      render json: @user.profile, status: :ok
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:address1, :address2, :city, :state, :zip, :user_id)
  end
end
