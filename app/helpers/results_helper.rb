# frozen_string_literal: true

module ResultsHelper

  def percent(result)
    ((result.correct_question.to_f / result.test.questions.all.count) * 100).to_i
  end

  def question_count(result)
    count = 0
    result.test.questions.order(:id).pluck(:id).each do |id|
      count += 1
      break if id == result.current_question.id
    end
    count
  end


end
