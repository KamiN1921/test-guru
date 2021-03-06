# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :find_test, only: :start

  def index
    @tests = Test.published_for_users
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.result(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
