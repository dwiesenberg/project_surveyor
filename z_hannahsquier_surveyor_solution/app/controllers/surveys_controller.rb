class SurveysController < ApplicationController

  def new
    @survey = Survey.new
  end

  def show
    @survey = Survey.find(params[:id])
    @question = @survey.questions.build
  end

  def index
    @surveys = Survey.all
  end

  def create
    @survey = Survey.new(white_listed_survey_params)
    if @survey.save
      flash[:success] = "hey you created a survey"
      redirect_to @survey
    else
      flash.now[:error] = "hwo do you screw up a survey"
      render :new
    end
  end

  private

    def white_listed_survey_params
      params.require(:survey).permit(:title, :description)
    end
end
