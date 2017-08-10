module QuestionsHelper

 def build_options(question, num_options)
  num_options.to_i.times do 
    question.options.build
  end
  question.options
 end
 
end
