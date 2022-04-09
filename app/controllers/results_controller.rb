class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_result, only: %i[show result update]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_result_not_found


  def show; end

  def result; end

  def update
    @result.accept!(params.require([:answer_ids]))
    if @result.completed?
      redirect_to result_result_path(@result)
    else
      render :show
    end

  end

  private

  def set_test_result
    @result = Result.find(result_params)
  end

  def result_params
    params.require(:id)
  end

  def rescue_with_result_not_found
    render plain: 'Result not found'
  end

  def next_question
    @result.next_question
  end
end
