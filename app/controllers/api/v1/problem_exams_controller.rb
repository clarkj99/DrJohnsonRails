class Api::V1::ProblemExamsController < ApplicationController
  before_action :find_problem_exam, only: [:show, :update]

  def show
    render json: @problem_exam, status: :ok
  end

  def update
    if @problem_exam.update(problem_exam_params)
      render json: @problem_exam, status: :ok
    else
      render json: { statusText: @problem_exam.errors.full_messages[0] }, status: :unauthorized
    end
  end

  private

  def find_problem_exam
    @problem_exam = ProblemExam.find(params[:id])
  end

  def problem_exam_params
    params.require(:problem_exam).permit(:appearance, :constitutional_details, :psychiatric_state, :psychiatric_details, :abdominal_tenderness, :abdominal_details, :mass_detected, :mass_details, :bowel_sounds, :pelvic_external, :pelvic_vaginal, :pelvic_uteris, :pelvic_ovaries, :pelvic_bladder, :pelvic_details)
  end
end
