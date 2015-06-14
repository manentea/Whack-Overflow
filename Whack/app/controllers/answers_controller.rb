class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def created
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.update(answer_params)
    if @answer.save
       redirect_to answer_path(@answer)
    else
      render :edit
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to answer_path(@answer)
  end

  private
  def answer_params
    params.require(:answer).permit(:body)
  end
end
