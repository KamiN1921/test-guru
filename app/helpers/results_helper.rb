# frozen_string_literal: true

module ResultsHelper

  def progress_now(result)
   ((result.index_question.to_d / result.test.questions.count)*100).to_i
  end
end
