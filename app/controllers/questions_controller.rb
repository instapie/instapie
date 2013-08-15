class QuestionsController < ApplicationController
  def index
    @questions = Question.latest(30)
  end

  def show
    @question = Question.find(params[:id])
    @answer = current_user.try(:answer_for, @question)
  end

  def new
    @question = Question.new
  end

  def create
    question = current_user.ask_question(*ask_question_params)
    flash[:notice] = "Asked question \"#{question.question}\""
    redirect_to(question)
  end

  def vote
    question = Question.find(params[:id])
    answer = current_user.answer_for(question)

    if answer.nil?
      current_user.answer_question(question, params[:option_id])
    else
      answer.update_attributes(:option_id => params[:option_id])
    end

    flash[:notice] = 'Submitted answer!'
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
    options = params.require(:options).map { |option| option[:option] }.reject(&:blank?)
    raise_error('You must supply at least 2 options!') if options.length < 2
    options
  end
end
