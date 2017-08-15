class QuestionsController < ApplicationController

include QuestionsHelper

  def new
    # binding.pry
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.build
    puts @question # test
    # would Question.new work just as well?
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @question = Question.new(whitelisted_question_params)
    if @question.save
      flash[:success] = "Question type saved. Now input the question."
      redirect_to edit_survey_question_path(@question.survey_id, @question)
    else
      flash.now[:error] = "Error! " + @question.errors.full_messages.to_s
      @survey
      @question
      render :new
    end
  end

  def edit
    @survey = Survey.find(params[:survey_id])
    @question = Question.find(params[:id])
    # view partial is _create_multiple_choice_1 or _create_number_range according to question_type. 
  end

  def update
    @survey = Survey.find(params[:survey_id])
    @question = Question.find(params[:id])
    # add options for redirect per multiple choice and number range question types
    if @question.update(whitelisted_question_params)
      if @question.question_type == "Multiple Choice"
        multiple_choice_success
      else # question_type == "Number Range"
        number_range_success
      end
    else
      flash.now[:error] = "Error! " + @question.errors.full_messages.to_s
      render :edit
    end
  end

  def multiple_choice_success
    flash[:success] = "Question initial data saved. Now input questions and options to choose from."
    redirect_to questions_edit_options_path(@question)
  end

  def number_range_success
    flash[:success] = "Question created!"  
    create_options(@question)
    redirect_to new_survey_question_path(@question.survey)
  end

  def edit_options
    binding.pry
    @question = Question.find(params[:id])
    @options = build_options(@question, @question.number_of_choices)
    @survey = @question.survey
  end

  def update_options
    @question = Question.find(params[:id])
    if @question.update(whitelisted_question_params)
      flash[:success] = "Question created!"
      @survey = @question.survey
      redirect_to new_survey_question_path(@question.survey)
    else
      flash.now[:error] = "Error! " + @question.errors.full_messages.to_s
      render :edit_options
    end
  end

  def destroy
    question = Question.find(params[:id])
    if question.destroy
      flash[:success] = "Question deleted!"
      redirect_to :root
    else
      flash[:error] = "Error! " + @question.errors.full_messages.to_s
      redirect_to new_survey_question_path(question.survey)
    end
  end

  private

  def extract_survey
    resource, id = request.path.split('/')[1,2]
    resource.singularize.classify.constantize.find(id)
  end

  # don't know why this is here in tingting's
  # def extract_survey
  #   resource, id = request.path.split('/')[1,2]
  #   resource.singularize.classify.constantize.find(id)
  # end


  def whitelisted_question_params
    params.require(:question).permit(:name, 
                                     :question_type, 
                                     :number_of_choices, 
                                     :multiple_responses,
                                     :required,
                                     :survey_id, 
                                     :minimum_range_value,
                                     :maximum_range_value,
                                   { :options_attributes => [
                                                        :name, 
                                                        :id,
                                                        :_destroy ] } )

  end

end



