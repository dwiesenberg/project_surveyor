class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(whitelisted_question_params)
  end

  def edit

  end

  def destroy

  end

  private

  def whitelisted_question_params
    params.require(:question).permit(:type)
  end
end
