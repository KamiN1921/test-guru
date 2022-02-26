class QuestionsController < ApplicationController

  def index
    @questionsall = Question.where(test_id: params["test_id"])
    render "questions/questionall"
  end

  def show
    @questionsall = Question.where(id: params["id"])
    render "questions/questionall"
  end
end
