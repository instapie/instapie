class QuestionsController < ApplicationController
  def index
    @questions = Question.latest(30)
  end

  def show
    @question = Question.find(params[:id])
  end
end
