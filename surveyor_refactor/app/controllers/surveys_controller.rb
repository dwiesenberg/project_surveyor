class SurveysController < ApplicationController

  include SurveysHelper

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

# methods for responses

  def survey_response_new
    # binding.pry
    @survey = Survey.find(params[:id])
    # @survey.questions.includes(:options)
    @response = @survey.responses.build
    # @response = build_responses(@survey)
  end

  def survey_response_create
    # binding.pry
    @survey = Survey.find(params[:id])
    if @survey.update(whitelisted_response_params)
      flash[:success] = "Success! Thank you for taking this survey."
      redirect_to :root
    else
      flash.now[:error] = "Error: " + @survey.errors.full_messages.to_s
      render :survey_response_new
    end
  end

  def survey_responses_show
    # binding.pry
    @survey = Survey.find(params[:id])
    @survey.questions.includes(:options)
    # @survey.questions.includes(:options) # no need to select :responses because one can obtain their count from "responses_count" in :options 
  end


  private

  def whitelisted_survey_params
    params.require(:survey).permit(:title, :description)
  end

  def whitelisted_response_params
    params.require(:survey).permit({:responses_attributes => [
                                                      :survey_id,
                                                      :question_id,
                                                      :option_id, 
                                                      :id,
                                                      :_destroy ] } )
  end

end
