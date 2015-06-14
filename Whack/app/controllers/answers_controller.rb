class AnswersController < ApplicationController
  before_action :get_answer, only: [:edit, :update, :destroy ]

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to question_path(question)
    else
      flash[:warn] = "Sorry that answer was not created. Please try again."
      redirect_to :back
    end
  end

  def update
    @answer.update(answer_params)
    if @answer.save
       redirect_to question_path(@question)
    else
      flash[:warn] = "Sorry that answer was not created. Please try again."
      redirect_to :back
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def destroy
    @answer.destroy
    redirect_to answer_path(@answer)
  end

  private

  def answer_params
    params.require(:answer).permit(:body, user_id: current_user.id, question_id: params[:question_id])
  end

  def get_answer
    @answer = Answer.find(params[:id])
  end
end
