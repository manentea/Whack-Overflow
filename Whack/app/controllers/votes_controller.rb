class VotesController < ApplicationController

  def create
    if params[:question_id]
      @question = Question.find(params[:question_id])
      vote = Vote.new(vote_params)
      vote[:user_id] = session[:user_id]
      vote.save
      @question.votes << vote
      redirect_to @question
    elsif params[:answer_id]
      @answer = Answer.find(params[:answer_id])
      vote = Vote.new(vote_params)
      vote[:user_id] = session[:user_id]
      vote.save
      @answer.votes << vote
      redirect_to @answer.question
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:votable_id, :votable_type, :votevalue)
  end

end
