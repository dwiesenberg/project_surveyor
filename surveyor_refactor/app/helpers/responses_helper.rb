module ResponsesHelper
end

module ResponsesHelper

  # def build_selections(response, number_of_questions)
  #   binding.pry
  #   3.times do |i|
  #     response.selections.build
  #   end
  #   response.selections
  # end

  def build_selections(response, number_of_questions)
    option_selections = []
    number_of_questions.times do |i|
      option_selections << response.selections.build
    end
    option_selections
  end


end

