class Test < ApplicationRecord
  has_many :results
  has_many :users, through: :results
  belongs_to :category
  belongs_to :author, class_name: "User"

  scope :test_categories, -> {joins(:category)}
  scope :easy, -> {where(level: 0..1)}
  scope :medium, -> {where(level: 2..4)}
  scope :hard, ->{where("level>5")}

  validates :level, numericality: { only_integer: true }
  validates :title, presence: true
  validates :title, uniqueness: { scope: :level, message: "must be uniq in level"}

  def self.test_from_category(category)
    test_categories.where('categories.title = ?',category).order(title: "DESC").pluck("title")
  end
end