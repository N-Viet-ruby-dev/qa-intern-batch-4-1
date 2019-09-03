class QuestionsController < ApplicationController
  before_action :logged_in, only: [:create]

  def create
    @question = current_user.questions.new question_params
    if @question.save
      redirect_to root_path, success: "Create successfully!"
    else
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def question_params
    params.require(:question).permit :category_id, :title, :content, tag_ids: []
  end
end
