# app/controllers/surveys_controller.rb
class Admin::SurveysController < ApplicationController

  def index
    # @surveys = Survey.all
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(whitelisted_survey_params)
      if @survey.save
        # puts "saved" # for testing
        session[:current_survey_id] = @survey.id
        flash[:success] = "Success! Survey created"
        redirect_to new_admin_question_path
        # redirect_to [:new, :admin, @question]
      else
        # puts @survey.errors.full_messages # for testing
        flash.now[:error] = "Error! Survey not created"
        render :new
      end
  end

  def show
    # not used as details shown on index page
    @survey = Survey.find(params[:id])
  end

  def edit
    # not used in assignment -- but may add to gain experience
    @survey = Survey.find(params[:id])
  end

  def update
    # not used in assignment -- but may add to gain experience
    @survey = Survey.find(params[:id])
      if @survey.update(whitelisted_survey_params)
       # puts "updated"
       flash[:success] = "Success! Survey updated"
       redirect_to edit_admin_question_path
       redirect_to [:edit, :admin, @question]
      else
       # puts @survey.errors.full_messages
       flash.now[:error] = "Failure! Survey not updated"
       render :edit
      end
  end

  def destroy
    @survey = Survey.find(params[:id])
      if @survey.destroy
       flash[:success] = "Success! Survey deleted"
      else
       flash[:error] = "Failure! Survey not deleted"
      end
    redirect_to admin_surveys_path
  end

  private

  def whitelisted_survey_params
    puts params
    params.require(:survey).permit(:title, :description)
  end

end