class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable :timeoutable,  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

  has_many :results
  has_many :tests, through: :results
  has_many :authored_tests, foreign_key: 'author_id', class_name: 'Test'

  validates :email, uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: 'must be email' }

  def all_user_tests(level)
    tests.where(level: level)
  end

  def result(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
