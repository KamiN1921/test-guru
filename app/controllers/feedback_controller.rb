class FeedbackController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index create]
  def create
    FeedbackMailer.contact_me(feedback_params, Admin.first).deliver_now
    flash[:info] = t('.success')
    redirect_to root_path
  end

  private

  def feedback_params
    params.permit(:name, :email, :subj)
  end
end
