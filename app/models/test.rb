class Test < ApplicationRecord
  has_many :results
  belongs_to :category
  belongs_to :user

  def self.test_from_category(category)
    Test.joins("JOIN categories on tests.category_id = categories.id").where('categories.title = ?',category).order(title: "DESC").pluck("title")
  end
end