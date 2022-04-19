class Question < ApplicationRecord
  has_many :answers
  validates :body, presence: true
  belongs_to :test
end
