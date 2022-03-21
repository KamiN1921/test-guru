class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show
    render inline: "<h1><%= 'ID #{@question.id}: #{@question.body}'%></h1>"
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(body: question_params)
    if @question.save
      render inline: "<h1>Created!</h1>"
    else
      render inline: "<h1>We have problems! try again</h1>"
    end
  end

  def destroy
    @question.destroy
  end

  private

  def question_params
    params.require(:question).require(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: "Question not found"
  end
end
