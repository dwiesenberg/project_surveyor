
# TingTing's




  def index
    @questions = Question.all
  end

  def new
    @survey = Survey.find_by_id(session[:current_survey_id])
    @question = Question.new
  end

  def create
    # save data to sessions to create records in one go at the end
    session[:question_type] = params[:question => :question_type]
    puts "params[:question => :question_type] =#{params[:question_type]}"
    puts "session[:question_type] = #{session[:question_type]}"
    # if params[:question_type] == "Multiple Choice"
      redirect_to admin_new_multiple_choice_1_path
    # else
    #   redirect_to admin_new_number_range_path
    # end 
  end

  def new_multiple_choice_1
    @survey = Survey.find_by_id(session[:current_survey_id])
  end

  def create_multiple_choice_1
    @question = Question.new
    # save data to sessions to create record in one go at the end
    session[:choices_total] = params[:choices_total]
    session[:multiple_option] = params[:multiple_option]
    session[:required] = params[:required]
    redirect_to admin_create_multiple_choice_2_path
  end

  def new_multiple_choice_2
    # Don't think need @survey = ...
    @survey = Survey.find_by_id(session[:current_survey_id])
    @question = Question.new
    @choices_total = session[:choices_total]
    @choices_group = []
    @choices_total.times do
      @choices_group << Choice.new
      # @question.choices.build
    end
  end

  def create_multiple_choice_2
    options = {}
    options[:question_text] = whitelisted_question_params[:question_text]
    options[:question_type] = session[:question_type]
    options[:required] = session[:required]
    options[:multiple_option] = session[:multiple_option]
    options[:survey_id] = session[:current_survey_id]
    options[:choices_total] = session[:choices_total]

    @question = Question.new(options) # must be in the right order ... create beforehand and pass in

    if @question.save
      flash[:success] = "Success! Question and choice(s) created"
      redirect_to [:admin, @question]
    else
      flash.now[:error] = "Error(s): " + @question.errors.full_messages
      render :new_multiple_choice_1
    end

  end

  def new_number_range
    #  do not need these yet until action where data saved and question & choices records created because of statelessness (ie. create_multiple_choice_2) ?
    @survey = Survey.find_by_id(session[:current_survey_id])
    @question = Question.new
    @choice = @question.choices.build
  end

  def create_number_range
    @question = Question.new(whitelisted_question_params)
    session[:minimum_range] = params[:minimum_range]
    session[:maximum_range] = params[:maximum_range]
    session[:required] = params[:required]

    # How can one create several child records from data input in a single nested form?

    if @question.save
     puts "saved" # for testing
      flash[:success] = "Success! Question and nested choice(s) created"
      redirect_to @question
    else
     puts @question.errors.full_messages # for testing
      flash.now[:error] = "Error! Question  and nested choice(s) not created"
      render :new_number_range
    end
  end


  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
    @choice = @question.choices.build
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(whitelisted_question_params)
      puts "updated"
      flash[:success] = "Success! Question and nested choice(s) updated"
      redirect_to @question
    else
      puts @question.errors.full_messages
      flash.now[:error] = "Failure! Question  and nested choice(s) not updated"
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:success] = "Success! Question  and nested choice(s) deleted"
    else
      flash[:error] = "Failure! Question  and nested choice(s) not deleted"
    end
    redirect_to questions_path
  end

  private

  # I don't think this will work:
  def whitelisted_question_params
    params.require(:question).permit(:question_text,
      choices_attributes: [:option, :id, :_destroy])
  end

  # Alternative? :
  # def whitelisted_question_params
  #   params.require(:question).permit(:question_text,
  #     :choices_attributes[options_total] => [:option, :id, :_destroy])
  # end