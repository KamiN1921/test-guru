class AchivmentsController < ApplicationController
  def index
    @achivments = current_user.badges
  end
end
