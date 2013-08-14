class QuestionsController < ApplicationController
  def index
    @questions = Question.latest(30)
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    question = current_user.ask_question(*ask_question_params)
    flash[:notice] = "Asked question \"#{question.question}\""
    redirect_to(question)
  end

  private

  def ask_question_params
    question_params = params.require(:question).permit(:question, :description)

    [
      question_params[:question],
      question_params[:description],
      options_params
    ]
  end

  def options_params
    params.require(:options).map { |option| option[:option] }
  end
end
