class Answer < ApplicationRecord
  default_scope { order created_at: :desc }

  belongs_to :user
  belongs_to :question
  has_many :votes, dependent: :destroy

  validates :content, presence: true

  def voted user
    self.votes.find_by user_id: user.id
  end
end
