module SurveysHelper

  def build_responses(survey)
    maximum_possible_responses = survey.questions.sum("number_of_choices")
    maximum_possible_responses.times do |i|
      survey.responses.build
    end
    survey.responses
  end

end

