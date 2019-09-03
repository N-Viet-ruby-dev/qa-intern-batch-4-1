class AnswersController < ApplicationController
  before_action :log_in_user, only: :create
  before_action :load_question, only: :create

  def create
    @answer = @question.answers.build(answer_params.merge(user_id: current_user.id))
    @answer.save
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
end
