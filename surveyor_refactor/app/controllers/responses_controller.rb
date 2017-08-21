class ResponsesController < ApplicationController

  include ResponsesHelper  

  def index
    @survey = Survey.find(params[:survey_id])
    @survey.questions.includes(:options)
    # @survey.questions.includes(:options) # no need to select :responses because one can obtain their count-for-survey from "responses_count" in @survey; and count-group-by-options from "selections_count" in :options
  end

  def new
    # binding.pry
    @survey = Survey.find(params[:survey_id])
    @survey.questions.includes(:options)
    @response = @survey.responses.build
    @selections = build_selections(@response, @survey.questions.count)
    @xxx = @selections
  end

  def create
    # binding.pry
    @survey = Survey.find(params[:survey_id])
    @response = Response.new(whitelisted_response_params)
    if @response.save
      flash[:success] = "Success! Thank you for taking this survey."
      redirect_to :root
    else
      flash.now[:error] = "Error: " + @response.errors.full_messages.to_s
      render :new
    end
  end

  private

  def whitelisted_response_params
    params.require(:response).permit(:survey_id, 
                        {:selections_attributes => [
                                        :response_id,
                                        :option_id,  
                                        :id,
                                        :_destroy,
                                        :option_id => []
                                          ] } )
  end

end