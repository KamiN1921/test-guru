class Test < ApplicationRecord
  has_many :results
  has_many :users, through: :results
  belongs_to :category
  belongs_to :author, class_name: "User"

  scope :test_from_category, ->(category) {joins(:category).where('categories.title = ?',category).order(title: "DESC").pluck("title")}
  scope :easy, -> {where(level: 0..1)}
  scope :medium, -> {where(level: 2..4)}
  scope :hard, ->{where("level>5")}

  validates :level, numericality: { only_integer: true }
  validates :body, presence: true
  validates :title, :level, uniqueness: true
end