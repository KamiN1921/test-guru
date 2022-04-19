module QuestionsHelper
  def question_header(question)
    question.new_record? ? t('helpers.new') : t('helpers.edit')
  end
end
