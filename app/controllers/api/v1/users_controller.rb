class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def profile
    render json: current_user.to_json(:include => [:profile]), status: :ok
  end

  def create
    @user = User.new({ email: user_params[:email], first_name: user_params[:first_name], last_name: user_params[:last_name], password: user_params[:password], role: 0 })
    if @user.valid?
      @user.save
      @token = encode_token(user_id: @user.id)
      render json: { user: JSON.parse(@user.to_json(:include => [:profile])), jwt: @token }, status: :ok
    else
      render json: { statusText: @user.errors.full_messages[0] }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :role)
  end
end
