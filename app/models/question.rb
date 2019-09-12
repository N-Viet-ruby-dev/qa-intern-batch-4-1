class Question < ApplicationRecord
  default_scope { order created_at: :desc }

  belongs_to :category
  belongs_to :user
  has_many :question_tags, dependent: :destroy
  has_many :tags, through: :question_tags
  has_many :answers, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  scope :with_associations, -> { includes(:tags, :user, :category) }
  scope :with_filter, -> (category_id) do
    where(category_id: category_id) unless category_id.blank?
  end

  def num_comments
    self.comments.size
  end
end
