class FeedbackController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  def new; end
  def create
    FeedbackMailer.contact_me(feedback_params, Admin.first).deliver_now
    flash[:info] = t('.success')
    redirect_to new_feedback_path
  end

  private

  def feedback_params
    params.permit(:name, :email, :subj)
  end
end
