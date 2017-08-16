module QuestionsHelper

  def multiple_choice_build_options(question, number_of_choices)
    number_of_choices.times do 
      question.options.build
    end
    question.options
  end
 
  def number_range_create_options(question)
    min = question.minimum_range_value
    max = question.maximum_range_value
    question.number_of_choices = (max - min + 1)
    question.save
    (min..max).each do |value| 
      question.options.create(name: value.to_s)
    end
    question.options
  end

end






