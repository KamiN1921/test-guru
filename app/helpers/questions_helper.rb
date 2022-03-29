module QuestionsHelper
  def question_header(question)
    question.new_record? ? 'New' : 'Edit'
  end
end
