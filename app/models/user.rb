class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results
  has_one :user
  def all_user_tests(level)
    tests.where(level: level)
  end
end
