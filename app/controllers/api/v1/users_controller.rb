class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:demo]

  def index
    case params[:role]
    when "patient"
      @users = User.patient.order(created_at: :desc)
    when "physician"
      @users = User.physician.order(:last_name)
    else
      @users = User.all.order(created_at: :desc)
    end

    render json: @users.to_json(:include => [:profile, :history]), status: :ok
  end

  def demo
    patient = User.patient[0]
    physician = User.physician[0]
    render json: { patient: patient, physician: physician }, status: :ok
  end

  def create
    if current_user.role == "patient"
      role = 0
    else
      role = 3
    end
    @user = User.create({ email: user_params[:email], first_name: user_params[:first_name], last_name: user_params[:last_name], password: user_params[:password], role: role })

    # We want to create both history and profile along with user
    if @user.valid?
      @user.create_history
      @user.create_profile
      # @user.save
      @token = encode_token(user_id: @user.id)

      render json: { user: JSON.parse(@user.to_json(:include => [:profile, :history])), jwt: @token }, status: :ok
    else
      render json: { statusText: @user.errors.full_messages[0] }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :role)
  end
end
