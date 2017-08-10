class ResponsesController < ApplicationController
  include ResponsesHelper

  def index
    @survey = Survey.find(params[:survey_id])
    @responses = Response.all
  end

  def new
    @survey = Survey.find(params[:survey_id])
    @response = @survey.responses.build
    @selections = build_options(@response, @survey.questions.count)
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @response = Response.new(response_params)
    if @response.save
      flash[:success] = 'Thanks for taking our survey!'
      redirect_to :root
    else
      flash[:warning] = @response.errors.full_messages
      redirect_to new_survey_response_path(@survey)
    end
  end

  private

  def response_params
    params.require(:response).permit(:survey_id,
                                    {:selections_attributes => [
                                                      :response_id,
                                                      :question_id,
                                                      :option_id,
                                                      :_destroy ] } )
  end


end
