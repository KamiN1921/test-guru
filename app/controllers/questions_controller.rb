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
    @question = @test.questions.create(question_params)
  end

  def destroy
    @question.destroy
  end

  private

  def question_params
    [body: params[:question][:body].to_s, test_id: params[:test_id]]
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
