class Answer < ApplicationRecord
  belongs_to :question
  scope :correct , -> {where(correct: true)}
  validates :body, presence: true

  validate :more_than_four

  def more_than_four
    mass = Answer.where(question_id: self.question_id).pluck
    if mass.length >= 4
      errors.add(:more_than_four, "can't be more than 4")
    end
  end
end
