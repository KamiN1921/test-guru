# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit update destroy]

  def index
    @tests = Test.all
  end

  def show
    redirect_to test_questions_path(@test.id)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
