class User < ApplicationRecord

  has_many :results
  has_many :tests, through: :results
  has_many :authored_tests, foreign_key: "author_id", class_name: "Test"

  validates :login, uniqueness:{ case_sensitive: false }
  validates :login, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'must be email' }
  has_secure_password

  def all_user_tests(level)
    tests.where(level: level)
  end

  def result(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end
end
