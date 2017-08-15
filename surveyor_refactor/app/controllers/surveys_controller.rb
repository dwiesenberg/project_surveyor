class SurveysController < ApplicationController

  def index
    @surveys = Survey.all
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(whitelisted_survey_params)
    if @survey.save
      flash[:success] = "Success! Survey title and description created."
      redirect_to new_survey_question_path(@survey)
    else        
      flash.now[:error] = "Error! " + @survey.errors.full_messages.to_s
      render :new
    end
  end

  private

  def whitelisted_survey_params
    params.require(:survey).permit(:title, :description)
  end

end
