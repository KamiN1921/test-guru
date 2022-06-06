class ResultsController < ApplicationController
  before_action :set_test_result
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_result_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :rescue_with_result_not_saved

  def show ;end

  def result
    @result.end_test! unless @result.completed? || @result.ended?
  end

  def update
    @result.accept!(params.require([:answer_ids]))

    if @result.completed? || @result.ended?
      if@result.success?
        achivment_service = AchivmentsService.new(@result)
        if achivment_service.call
          flash[:notice] = t('.get_achivment') + "#{ view_context.link_to(t('.reward'), achivments_path, target: :_blank) }"
        end
      end
      TestsMailer.completed_test(@result).deliver_now
      redirect_to result_result_path(@result)
    else
      render :show
    end
  end

  def gist
    client = GistQuestionService.new(@result.current_question)
    result = client.call
    if client.success?
      current_user.gists.create!(question: @result.current_question,
                                 url: result.html_url)
      flash_options = {notice: view_context.link_to(t('.success'),result.html_url,target: :_blank, remote: true)}
    else
      flash_options = {alert: t('.failure')}
    end
    redirect_to @result, flash_options
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

  def rescue_with_result_not_saved
    render plain: 'Error with save'
  end

  def next_question
    @result.next_question
  end
end
