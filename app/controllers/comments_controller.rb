class CommentsController < ApplicationController
  before_action :log_in_user, only: :create
  before_action :load_question, only: :create

  def create
    @comment = @question.comments.build comment_params
    @comment.user_id = current_user.id
    @comment.save
    respond_to do |format|
      format.js
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :answer_id)
  end

  def load_question
    @question = Question.find_by id: params[:question_id]
    redirect_to questions_path, info: "Something go wrong" unless @question
  end
end
