module SurveysHelper

  def build_responses(survey)
    responses = survey.questions.map {|q| survey.responses.build(question_id: q.id)}
  end

end

