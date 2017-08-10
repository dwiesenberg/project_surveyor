class SurveysController < ApplicationController

  def index
    @surveys = Survey.all
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      flash[:success] = "You've built a survey! Now start adding questions!"
      redirect_to new_survey_question_path(@survey)
    else
      flash[:warning]
      render :new
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :description)
  end
end
