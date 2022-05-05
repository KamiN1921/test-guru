class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  validates :body, presence: true
  belongs_to :test
  has_many :results, foreign_key: 'current_question_id', dependent: :destroy
  has_many :gists, dependent: :restrict_with_exception
end
