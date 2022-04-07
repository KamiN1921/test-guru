class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results
  has_many :authored_tests, foreign_key: "author_id", class_name: "Test"

  validates :login, presence: true


  def all_user_tests(level)
    tests.where(level: level)
  end

  def result(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end
end
