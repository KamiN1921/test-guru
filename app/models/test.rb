class Test < ApplicationRecord
  has_many :results
  has_many :users, through: :results
  belongs_to :category
  belongs_to :author, class_name: "User"

  def self.test_from_category(category)
    Test.joins(:category).where('categories.title = ?',category).order(title: "DESC").pluck("title")
  end
end