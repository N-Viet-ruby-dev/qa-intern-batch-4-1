class AnswersController < ApplicationController
  before_action :log_in_user, only: :create
  before_action :load_question, only: :create
  before_action :load_answer, only: [:edit, :update, :destroy, :vote]
  before_action :load_vote, only: :unvote

  def create
    @answer = @question.answers.build(answer_params.merge(user_id: current_user.id))
    @answer.save
    respond_to do |format|
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    @answer.update answer_params
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @answer.destroy
    redirect_to @answer.question, info: "Delete successfully!!!"
  end

  def vote
    @vote = @answer.votes.build user_id: current_user.id
    @vote.save
    respond_to do |format|
      format.js
    end
  end

  def unvote
    @vote.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def answer_params
    params.require(:answer).permit :content
  end

  def load_question
    @question = Question.find_by(id: params[:question_id])
    redirect_to questions_path, info: "Question doesn't exist." unless @question
  end

  def load_answer
    @answer = Answer.find_by(id: params[:id])
    redirect_to questions_path, notice: "Answer no longer exist!!" unless @answer
  end

  def load_vote
    @vote = Vote.find_by(id: params[:id])
    redirect_to questions_path, notice: "Vote no longer exist!!" unless @vote
  end
end
