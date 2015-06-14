class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def article_params
    params.require(:answer).permit(:body)
  end
end
