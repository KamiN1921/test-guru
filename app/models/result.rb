class Result < ApplicationRecord
  SUCCESS_PER = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first, on: :create
  before_update :next_question

  def accept!(answer_ids)
    self.correct_question += 1 if correct_answer?(answer_ids)
    save
  end

  def completed?
    current_question.nil?
  end

  def percent
    ((self.correct_question.to_f / self.test.questions.all.count) * 100).to_i
  end

  def success?
    percent >= SUCCESS_PER
  end

  def next_question
    raise StandardError, "NoQuestions" if (self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first).nil?
  end

  def index_question
    self.test.questions.index(current_question) + 1
  end

  private

  def before_validation_set_first
    self.current_question = test.questions.order(:id).first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.flatten.reject!(&:blank?).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end
