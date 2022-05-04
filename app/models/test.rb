class Test < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :users, through: :results
  belongs_to :category
  belongs_to :author, class_name: 'User'

  scope :test_categories, ->(category) { joins(:category).where('categories.title = ?', category) }
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where('level>5') }

  validates :level, numericality: { only_integer: true }
  validates :title, presence: true, uniqueness: { scope: :level, message: 'must be uniq in level' }
  def self.get_mass
    order(title: 'DESC').pluck('title')
  end
end
