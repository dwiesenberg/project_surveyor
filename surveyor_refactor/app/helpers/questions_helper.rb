module QuestionsHelper

  def build_options(question, number_of_choices)
    number_of_choices.to_i.times do 
      question.options.build
    end
    question.options
  end
 
  def create_options(question)
    min = question.minimum_range_value
    max = question.maximum_range_value
    (min..max).each do |value| 
      question.options.create(name: value.to_s)
    end
    question.options
  end

end






