class Test < ApplicationRecord
  has_many :results
  belongs_to :category

  def self.test_from_category(category)
    select("title").from("tests").joins("JOIN categories on tests.category_id = categories.id").where('categories.title = ?',category).order(title: "DESC")
  end
end