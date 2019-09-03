module CommentsHelper
  def num_comments question
    question.comments.where(answer_id: nil).size
  end

  def select_comments comments, answer_id = nil
    comments.select { |c| c.answer_id === answer_id }
  end
end
