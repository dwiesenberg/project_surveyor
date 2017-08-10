class QuestionsController < ApplicationController
  include QuestionsHelper

  def new
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.build
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "Thanks for choosing a question type! Now create your question!"
      redirect_to edit_survey_question_path(@question.survey_id, @question)
    else
      flash.now[:warning] = @question.errors.full_messages
      @survey
      @question
      render :new
    end
  end

  def edit
    @survey = Survey.find(params[:survey_id])
    @question = Question.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:survey_id])
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:success] = "Great! Now let's fill out the question content!"
      redirect_to question_edit_options_path(@question)
    else
      flash.new[:warning] = @question.errors.full_messages
      render :edit
    end
  end

  def edit_options
    @question = Question.find(params[:id])
    @options = build_options(@question, @question.num_options)
    @survey = @question.survey
  end

  def update_options
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:success] = "Question created!"
      @survey = @question.survey
      redirect_to new_survey_question_path(@question.survey)
    else
      flash.now[:warning] = @question.errors.full_messages
      render :edit_options
    end
  end

  def destroy
    question = Question.find(params[:id])
    if question.destroy
      flash[:success] = "Deleted!"
      redirect_to :root
    else
      flash[:warning] = "Error!"
      redirect_to new_survey_question_path(question.survey)
    end
  end

  private

  def extract_survey
    resource, id = request.path.split('/')[1,2]
    resource.singularize.classify.constantize.find(id)
  end

  def question_params
    params.require(:question).permit(:question_type, 
                                     :content, 
                                     :survey_id, 
                                     :required, 
                                     :num_options, 
                                     :one_selection,
                                   { :options_attributes => [
                                                        :content, 
                                                        :_destroy ] } )
  end

end
